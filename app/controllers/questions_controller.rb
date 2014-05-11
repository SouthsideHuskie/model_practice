class QuestionsController < ApplicationController
  def question_1
    # What is the most recent movie on the list that the second actor appeared in?

    # Your Ruby goes here.

    # @most_recent_movie_for_second_actor = ???

    the_actor = Actor.second

    the_actors_movies = []

    the_actor.roles.each do |the_role|
      the_actors_movies.push(the_role.movie)
    end

    most_recent_movie = { :year => 0, :title => "" }

    the_actors_movies.each do |the_movie|
      if the_movie.year.to_i > most_recent_movie[:year]
        most_recent_movie = { :year => the_movie.year.to_i, :title => the_movie.title }
      end
    end

    @most_recent_movie_for_second_actor = most_recent_movie[:title]

  end

  def question_2
    # Who directed the longest movie on the list?

    # Your Ruby goes here.

    #@director_of_longest_movie =


@director_of_longest_movie = Movie.order("duration DESC").first.director.name

  end

  def question_3
    # Which director has the most movies on the list?

    # Your Ruby goes here.

   the_leader = Director.new

     Director.all.each do |the_director|
       if the_director.movies.count > the_leader.movies.count
         the_leader = the_director
      end
   end

     @director_with_the_most_movies = the_leader.name

  end

  def question_4
    # Which actor has been in the most movies on the list?
    # (If there's a tie, any one of them is fine)

    # Your Ruby goes here.

    top_actor = Actor.new

    Actor.all.each do |the_actor|
      if the_actor.movies.count > top_actor.movies.count
        top_actor = the_actor
      end

    end
    @actor_with_the_most_movies = top_actor.name
  end

  def question_5
    # This one is hard. Work on it after all your other review is complete.

    # Which actor/director pair has the most movies on the list?
    # (If there's a tie, any pair of them is fine)

    # Your Ruby goes here.


   # @actor = ???
    # @director = ???
     # @movies_together = ???

     most_movies_together = 0
     @actor = nil
     @director = nil

     Actor.all.each do |actor|
       this_actors_most_movies_with_one_director = 0
       this_actors_favorite_director = nil

       actor.movies.each do |movie|
         number_of_movies_with_same_director_as_this_one = actor.movies.where(:director_id => movie.director_id).count

         if this_actors_most_movies_with_one_director < number_of_movies_with_same_director_as_this_one
           this_actors_most_movies_with_one_director = number_of_movies_with_same_director_as_this_one
           this_actors_favorite_director = movie.director
         end
       end

       if most_movies_together < this_actors_most_movies_with_one_director
         most_movies_together = this_actors_most_movies_with_one_director
         @director = this_actors_favorite_director
         @actor = actor
       end
     end

     @movies_together = @actor.movies.where(:director_id => @director.id)
   end
 end
