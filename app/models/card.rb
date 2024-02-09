class Card < ApplicationRecord
  require 'mini_magick'
  require 'tesseract'

  belongs_to :owner, class_name: "User"

  # Instance method to extract text from an image
  def extract_text_from_image(image_path)
    image = MiniMagick::Image.open(image_path)

    # Perform any necessary image preprocessing
    image.resize '300x300'

    # Use Tesseract to extract text from the image
    tesseract = Tesseract::Engine.new
    text = tesseract.from_blob(image.to_blob).text.strip

    text
  end

  # Instance method to parse text into a card object
  def parse_text_into_card(text)
    # Implement your logic to parse the extracted text into a card object
    # This could involve regular expressions, string manipulation, or custom logic
    # For simplicity, let's assume the text is comma-separated values
    card_data = text.split(',')

    # Create a card hash with attributes
    card = {
      name: card_data[0],
      card_type: card_data[1],
      power: card_data[2].to_i,
      cost: card_data[3].to_i,
      # Add more attributes based on your data format
    }

    card
  end

  # Example usage method
  def process_image_and_parse(image_path)
    text = extract_text_from_image(image_path)
    parse_text_into_card(text)
  end
end
