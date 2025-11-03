

# this was originally a test for a job..
# i just used it to test/benchmark various algorithms


# trying on throw-away travel chromebook
# github.dev?
#  - no extensions :(
# zed?
#  - chromeos linux contianer problem..?
# emacs
#  - lol, the only thing that works on this thing!
#  - can use pry to see methods

# first attempt, slowly

class Exercise
  
  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str) # note: use self.method for static methods; the tests use it
    words = str.split(/\b/).map do |word| # array, split by regex word (b)oundary NOTE: punctuation counts as a seperate word/element
    # iteration method: replaces words in an array, otherwise preserves the original word/element
    #words.each_with_index do |word, i|
      # letters_and_apostrophes = "/\A[a-zA-Z']+\z/"
      if word.match?(/\w+/) and word.length > 4 # match regex (w)ord character (it's quite strange..: letters, digits, and underscores, NOT apostrophes) + repeat
        word[0] == word[0].upcase ? "Marklar" : "marklar" # no char type in ruby # NOTE: word.capitalize means the rest of the word is lowercase
      else
        word # necessary if using map
      end
    end.join #return words.join
  end


  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(n)
    # Exercise.fib_even_sum_recursive(n) # 5.9, 5.6, 6.5, --yjit 1.3!, --mjit 4.3
      # NOTE: even at n = 35, it's noticeable
    Exercise.fib_even_sum_recursive(n, true)
    # Exercise.fib_even_sum_functional(n) # .004, .01, --yjit .017, --mjit .017
      # uses the most memory: one array
      # but maybe CPUs optimize for this stuff..
    #Exercise.fib_even_sum_procedural(n) # .009, .008, .02, --yjit .02, --mjit .0026!

    # --yjit adds a tiny startup time of ~1s, but otherwise, worth it!
    # --mjit did the best for procedural..??

    # ruby's multiple loop syntaxes behave slightly different
    # i think it depends on if you add an iteator and an index:
    # 5.times do > (0..5).each > (0..5).each |i|)
    # while (i < data.count) > data.each > data.each |i|
    # for is just sugar in ruby
    # all of it won't matter once it goes into yjit or llvm! :)
    # so just use n.times do, (0..n).each |i|, data.each |i| for everything!
  end

  def self.fib_even_sum_procedural(nth)
    case nth
      when -> (x) { x < 0 } # when nth < 0 NOTE: cannot combine expression with value comparisons.. :/
        raise "no negative"
      when 0
      	return 0
      when 1, 2
      	return 1
    end
    
    c, n, t = 1, 1, 0 # current, next, temp swap; default values: f(1)=1, f(2)=1
      # note syntax error: a, b = 1
      # note: next is a keyword?
    sum = 0
    
    # doesn't ask for the sequence.. just the sum
    # so no need to store the sequence in an array
    (nth - 2).times do
      t = c # ruby probably has fancy swap syntax..
      c = n # iterate
      n += t # next = sum of last two

      if n.even?
        sum += n
      end
    end
    
    return sum
  end

  # ruby's functional ways are so much neater, more modular! can't wait to use elixir!!
  def self.fib_functional(n)
    raise "input invalid: <= 2" if n <= 2

    s = [0, 1] # sequence
    (2..n).each do |i|
      s << s[i - 1] + s[i - 2] # append array/hash syntax << (not += / concat) # modifies array in place ~O(1)
    end

    s.freeze
  end

  def self.fib_even_sum_functional(n)
    Exercise.fib_functional(n).select(&:even?).sum
  end

  def self.fib_recursive(n)
    return 0 if n == 0 # necessary!
    return 1 if n == 1
    fib_recursive(n-1) + fib_recursive(n-2)
  end

  def self.fib_recursive_threaded(n)
    return 0 if n == 0 # necessary!
    return 1 if n == 1
    t = Thread.new { fib_recursive(n-1) }
    t2 = Thread.new { fib_recursive(n-2) }

    t.join
    t2.join

    t.value + t2.value
    # fib_recursive(n-1) + fib_recursive(n-2)
  end


  def self.fib_even_sum_recursive(n, threaded = false)
    return 0 if n < 2

    s = 0
    # TODO: stopped here, how to set a var to a function? this exectures it..
    f = threaded ? Exercise.fib_recursive_threaded : Exercise.fib_recursive

    (2..n).each do |i|
      t = f(i) #Exercise.fib_recursive_threaded(i)
      s += t if t.even?
    end

    s
  end

  def self.test_marklar
    puts Exercise.marklar("  1 four more-than-four Capital-falcon")
  end
  
  def self.test_fib
    begin
      puts even_fibonacci(-1)
    rescue => e
      puts e
    end
    # wow, what a pain.. use puts instead of exception

    35.times do |i|
      puts Exercise.even_fibonacci(i)
    end
  end

  def self.test_freeze
    s = Exercise.fib_functional(5)
    begin
      s[2] = "mutation" # deep
      #s << ["mutation"] # shallow
    rescue => e
      puts e
    end
  end

end


#Exercise.test_marklar
#Exercise.test_fib
#Exercise.test_freeze

#binding.pry # required to use pry
