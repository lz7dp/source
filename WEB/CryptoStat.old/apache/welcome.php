<?php
require('includes/html_form.class.php');

// arrays for select list demos
$cryptos = array('BCN', 'BTC', 'STORJ', 'XRP', 'ETH', 'XRM', 'TNC');
$months = array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12); 
$years = array(2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030); 

// create instance of HTML_Form
$frm = new HTML_Form();

// using $frmStr to concatenate long string of form elements
// startForm arguments: action, method, id, optional attributes added in associative array
$frmStr = $frm->startForm('result.php', 'post', 'demoForm',
            array('class'=>'demoForm', 'onsubmit'=>'return crypto month year') ) . PHP_EOL .
    
    // fieldset and legend elements
    $frm->startTag('fieldset') . PHP_EOL .
 
    $frm->startTag('legend') . 'Choice crypto & time period' . $frm->endTag() . PHP_EOL .
    
    // wrap form elements in paragraphs 
    $frm->startTag('p') . 
    // endTag remembers startTag (but you can pass tag if nesting or for clarity)
    $frm->endTag() . PHP_EOL .

    $frm->startTag('p') . 
    $frm->startTag('label') . 'Crypto: ' . 
    // arguments: name, array containing option text/values
    // include values attributes (boolean),
    // optional arguments: selected value, header, additional attributes in associative array
    $frm->addSelectList('crypto', $cryptos, false, 'BCN') .
    $frm->endTag('label') . 
    $frm->endTag('p') . PHP_EOL .

    $frm->startTag('p') .
    $frm->startTag('label') . 'Month: ' .
    // arguments: name, array of option values, array of option text
    // optional arguments: selected value, header, additional attributes in associative array
    $frm->addSelectList('month', $months, false, 8) .
    $frm->endTag('label') .
    $frm->endTag() . PHP_EOL .

    $frm->startTag('p') .
    $frm->startTag('label') . 'Year: ' .
    // arguments: name, array of option values, array of option text
    // optional arguments: selected value, header, additional attributes in associative array
    $frm->addSelectList('year', $years, false, 2020) .
    $frm->endTag('label') .
    $frm->endTag() . PHP_EOL .

    $frm->startTag('p') . 
    $frm->addInput('submit', 'submit', 'Submit') .
    $frm->endTag() . PHP_EOL .

//    $frm->startTag('p') .
//    $frm->addTextarea($name, $rows = 1, $cols = 100, $value = 'https://github.com/lz7dp/source/tree/master/CryptoStat' )
//    $frm->endTag() . PHP_EOL .


    $frm->endTag('legend') . PHP_EOL .
    $frm->endTag('fieldset') . PHP_EOL .

    $frm->endForm();

// finally, output the long string

echo $frmStr;
?>

<a href="https://github.com/lz7dp/source/tree/master/CryptoStat">CryptoStat project source code</a>

