# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
 @candidates.each do |item|
   if item[:id]==id
     @result = item
   end
 end
 @result
end

def experienced?(candidate)
  candidate[:years_of_experience] >=2
end

def qualified_candidates(candidates)
  @qualifiedcandidates = []
  candidates.each do |candidate|
    if experienced?(candidate) && github(candidate) && languages(candidate) && date_applied(candidate) && age(candidate)
      @qualifiedcandidates.push(candidate)
    end
  end
  @qualifiedcandidates
end

# More methods will go below
def github(candidate)
  candidate[:github_points] >= 100
end

def languages(candidate)
  candidate[:languages].include? ("Ruby" || "Python")
end

def date_applied(candidate)
  candidate[:date_applied] >= 15.days.ago
end

def age(candidate)
  candidate[:age] >= 18
end

def ordered_by_qualifications(candidates)
  @result = candidates.sort_by {|candidate| [-candidate[:years_of_experience], -candidate[:github_points]]}
end
# More methods will go below
