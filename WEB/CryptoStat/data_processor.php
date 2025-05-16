<?php
// data_processor.php
header('Content-Type: application/json');

$csvFile = 'processed4_storj_data.csv';
$data = [];
$headers = [];

if (($handle = fopen($csvFile, 'r')) !== false) {
    $headers = fgetcsv($handle); // Get headers
    
    while (($row = fgetcsv($handle)) !== false) {
        $data[] = array_combine($headers, $row);
    }
    fclose($handle);
}

// Reverse the array to get the latest records first
$reversedData = array_reverse($data);

// Prepare data for charts
$chartData = [
    'labels' => [],
    'price' => [],
    'pred_price' => [],
    'percent_change' => [],
    'signal' => []
];

// Limit to the last 100 records for better performance
$limit = 100;
$count = 0;

// Get the last signal and percent change to use for prediction
$lastSignal = null;
$lastPercentChange = null;
$lastPrice = null;

// First pass to find the most recent actual data point
foreach ($reversedData as $row) {
    if ($row['price'] != 0) { // Find the last row with actual data
        $lastSignal = (int)$row['Signal'];
        $lastPercentChange = (float)$row['Percent Change'];
        $lastPrice = (float)$row['price'];
        break;
    }
}

// Second pass to prepare chart data and calculate predictions
foreach ($reversedData as $row) {
    if ($count++ >= $limit) break;
    
    $currentPrice = (float)$row['price'];
    $currentSignal = (int)$row['Signal'];
    $currentPercentChange = (float)$row['Percent Change'];
    
    // Calculate predicted price based on last signal
    $predictedPrice = 0;
    if ($lastSignal !== null && $lastPercentChange !== null && $lastPrice !== null) {
        if ($lastSignal === 1) { // Buy signal - price increases
            $predictedPrice = $lastPrice * (1 + ($lastPercentChange / 100));
        } else { // Sell signal - price decreases
            $predictedPrice = $lastPrice * (1 - ($lastPercentChange / 100));
        }
    }
    
    $chartData['labels'][] = $row['price_date'] . ' ' . $row['price_time'];
    $chartData['price'][] = $currentPrice;
    $chartData['pred_price'][] = $predictedPrice;
    $chartData['percent_change'][] = $currentPercentChange;
    $chartData['signal'][] = $currentSignal;
    
    // Update last values if this row has actual data (pred_price != 0)
    if ((float)$row['price'] != 0) {
        $lastSignal = $currentSignal;
        $lastPercentChange = $currentPercentChange;
        $lastPrice = $currentPrice;
    }
}

echo json_encode($chartData);
?>