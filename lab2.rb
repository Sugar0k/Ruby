def foo(s)
  s = s.split(' ')
  ts = s[1].upcase
  if(ts[-1] == 'S' && ts[-2] == 'C')
    puts 2 ** ts.size
  else 
    puts s[1].reverse
  end
end

def poks
  puts "Сколько будет покемонов?"
  n = gets.to_i
  count = 0
  hash
  puts "Ведите имя и цвет покемонов"
  pokemons = Array.new
  n.times do |i|
    puts "#{i+1}: "
    pok = gets.chomp
    color = gets.chomp
    pokemons[i] = {:name => pok, :color => color}

  end
  puts pokemons
end

loop do
    print "Запустить первый метод введите 1\n"
    print "Запустить второй метод введите 2\n"
    print "Для выхода введите -1\n"
    input = gets.to_i
    puts "Вы ввели #{input}\n"

    break if input == -1 
    if input == 1 
      puts "Введите строку"
      s = gets.to_s
      foo(s)
    elsif input == 2 
      poks
    end
end
