DATA = [
  ['React Native Development', 'Rubyroid Labs has been on the web and mobile...'],
  ['Dedicated developers', 'Rubyroid Labs can boost your team with dedicated developers mature in Ruby on Rails and React Native, UX/UI designers, and QA engineers.'],
  ['Ruby on Rails development', 'Use our Ruby on Rails developers in your project or hire us to review and refactor your code.'],
  ['CRM development.', 'We have developed over 20 CRMs for real estate, automotive, energy and travel companies.'],
  ['Mobile development.', 'We can build a mobile app for you that works fast, looks great, complies with regulations and drives your business.']
]

desc 'Fills database with data and calculate embeddings for each item.'
task index_data: :environment do
  openai_client = OpenAI::Client.new

  DATA.each do |item|
    page_name, text = item

    response = openai_client.embeddings(
      parameters: {
        model: 'text-embedding-ada-002',
        input: text
      }
    )

    embedding = response.dig('data', 0, 'embedding')

    Item.create!(page_name:, text:, embedding:)

    puts "Data for #{page_name} created!"
  end
end