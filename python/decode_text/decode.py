def decode(message_file):
    # Read the contents of the file
    with open(message_file, 'r') as file:
        lines = file.readlines()

    # Extract numbers and words from each line
    pairs = [(int(line.split()[0]), line.split()[1]) for line in lines]

    # Sort the pairs based on the numbers
    pairs.sort()
    pair_number = 1
    # Create a list to store the decoded words
    decoded_words = []

    # Iterate through each pair and add the last word of each row to the decoded list
    index = 2
    for pair in pairs:
        if pair[0] == pair_number:
            decoded_words.append(pair[1])
            pair_number = pair[0] + index
            index = index + 1
        
    # Combine the words into a sentence
    decoded_sentence = ' '.join(decoded_words)
    return decoded_sentence

# Example Usage:
message_file = 'message.txt'
decoded_message = decode(message_file)
print(decoded_message)
