require 'socket'

server = TCPServer.new(3000)

class CashMachine
  def readfile(file_name)
    @file_name = file_name
    if File.exist?(@file_name)
      File.open(@file_name) do
        balance_file = File.readlines(@file_name)
        bal = balance_file[0]
        @balance = bal.to_i
      end
    else
      @balance = 100.0
    end
  end

  def deposit(d_value)
    d_value = d_value.to_i
    if d_value>0
      @balance += d_value
      File.write(@file_name, "#{@balance}", mode: "w")
      balance
    else
      'Enter an amount greater than 0'
    end
  end

  def withdraw(w_value)
    w_value = w_value.to_i
    if w_value>0 and w_value<=@balance
      @balance -= w_value
      File.write(@file_name, "#{@balance}", mode: "w")
      balance
    else
      "Insufficient funds"
    end
  end

  def balance
    "Your balance:#{@balance}"
  end
end

atm=CashMachine.new
while (connection = server.accept)

  atm.readfile("Balance.txt")
  request = connection.gets

  m, full_path = request.split(' ')

  connection.print "HTTP/1.1 200\r\n"
  connection.print "Content-Type: text/html\r\n"
  connection.print "\r\n"

  if m == 'GET'
    path, num = full_path.split('?value=')
    connection.print case path
                     when '/balance'
                       atm.balance
                     when '/deposit'
                       atm.deposit(num)
                     when '/withdraw'
                       atm.withdraw(num)
                     when '/quit' then break
                     else
                       'Check your enter'
                     end
  end


end
