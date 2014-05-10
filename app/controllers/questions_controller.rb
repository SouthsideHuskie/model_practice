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

    #movie_counts = []
#
    #Director.all.each do |the_director|
    #  number_of_movies_directed_by_the_director = the_director.movies.count
#
    #  movie_counts.push(number_of_movies_directed_by_the_director)
    #end
#
    #@most_number_of_movies_by_a_single_director = movie_counts.max.
#
    #@director_with_the_most_movies =  @most_number_of_movies_by_a_single_director

    @director_with_the_most_movies = Director.order("movies.count DESC").first.director.name


  end

  def question_4
    # Which actor has been in the most movies on the list?
    # (If there's a tie, any one of them is fine)

    # Your Ruby goes here.

    # @actor_with_the_most_movies =
  end

  def question_5
    # This one is hard. Work on it after all your other review is complete.

    # Which actor/director pair has the most movies on the list?
    # (If there's a tie, any pair of them is fine)

    # Your Ruby goes here.

    # @actor = ???
    # @director = ???
    # @movies_together = ???
  end
end
