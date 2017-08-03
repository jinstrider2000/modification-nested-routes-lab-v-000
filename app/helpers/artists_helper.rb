module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(action, form_builder)
    if action == :new && params[:artist_id].blank?
      <<-HTML
        #{form_builder.label :artist_name}
        #{form_builder.text_field :artist_name}
      HTML
    elsif action == :edit && params[:artist_id].blank? 
      form_builder.collection_select :artist_id, Artist.all, :id, :name
    elsif action == :new
      <<-HTML
        #{form_builder.hidden_field :artist_id}
        <p>Artist Name: #{@artist.name}</p>
      HTML
    else
      <<-HTML
        #{form_builder.hidden_field :artist_id}
        <p>Artist Name: #{@song.artist_name}</p>
      HTML
    end
  end
end
