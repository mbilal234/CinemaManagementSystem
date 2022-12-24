const { MovieDb } = require('moviedb-promise')
const moviedb = new MovieDb('e9f0a1e64e12aa6748cf8b29b8aa9dcb')

async function searchMovieResults(req, res) {
    console.log(req.query.searchQuery);
    var iterator = 0;
    var movies = [];
    if (req.query.searchQuery) {
        movies = await moviedb.searchMovie(req.query.searchQuery);
        iterator = movies.results.length;
    }
    
    const result = movies.results;
    console.log(result);
    res.render("insertFilm.ejs", {result, iterator})
}

//Exports
module.exports = {searchMovieResults} 






