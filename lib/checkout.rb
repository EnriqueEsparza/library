require('date')

class Checkout
  attr_reader(:patron_id, :book_copy_id, :on_date)

  define_method(:initialize) do |attributes|
    @patron_id = attributes.fetch(:patron_id)
    @book_copy_id = attributes.fetch(:book_copy_id)
    #binding.pry
    @on_date = attributes.fetch(:on_date)
    if attributes.has_key?(:id)
      @id = attributes.fetch(:id)
    end
  end

  define_singleton_method(:find_by_patron_id) do |patron_id|
    checkouts = []
    sql = "SELECT * FROM checkedout WHERE patron_id = #{patron_id}"
    results = DB.exec(sql)
    results.each do |result|
      id = result.fetch('id').to_i()
      book_copy_id = result.fetch('book_copy_id').to_i()
      on_date = result.fetch('on_date')
      checkout = Checkout.new({ :on_date => on_date, :id => id, :patron_id => patron_id, :book_copy_id => book_copy_id })
      checkouts.push(checkout)
    end
    checkouts
  end

  define_method(:save) do
    sql = "INSERT INTO checkedout (patron_id, book_copy_id, on_date)
    VALUES ('#{@patron_id}', #{@book_copy_id}, '#{@on_date}') RETURNING id;"
    result = DB.exec(sql)
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:all_overdue) do
    today = Date.today
    overdue = (today - 20).to_s
    overdue_books = []
    sql = "SELECT * FROM checkedout WHERE on_date < '#{overdue}'"
    results = DB.exec(sql)
    results.each do |result|
      id = result.fetch('id').to_i()
      book_copy_id = result.fetch('book_copy_id').to_i()
      on_date = result.fetch('on_date')
      patron_id = result.fetch('patron_id')
      checkout = Checkout.new({ :on_date => on_date, :id => id, :patron_id => patron_id, :book_copy_id => book_copy_id })
      overdue_books.push(checkout)
    end
    overdue_books
  end

end
