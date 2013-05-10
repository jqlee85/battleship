#helper functions

#takes in string and returns true if letter, false if not
def letter?(lookAhead)
  if lookAhead =~ /[[:alpha:]]/
    return true
  else
    return false
  end
end

#takes in string and returns true if numeric, false if not
def numeric?(lookAhead)
  if lookAhead =~ /^[-+]?[0-9]*\.?[0-9]+$/
    return true
  else
    return false
  end
end



#converts letter to corresponding number
#ex a=>1, b=>2, etc, Only works for a single digit at the moment
def letter_to_num(letter)
  
  if letter?(letter) == false
    return false
  end
  
  if letter.length != 1
    return false
  end
  
  letter = letter.downcase
  
  number = letter.ord - 96
end