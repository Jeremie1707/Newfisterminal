import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const truckAutocompleteSearch = function() {
  const search = JSON.parse(document.getElementById('search-truck').dataset.truck)
  const searchInput = document.getElementById('research_truck');

  if (search && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
          term = term.toLowerCase();
          const choices = search;
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      },
    });
  }
};

const trailerAutocompleteSearch = function() {
  const search = JSON.parse(document.getElementById('search-trailer').dataset.trailer)
  const searchInput = document.getElementById('research_trailer');

  if (search && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
          term = term.toLowerCase();
          const choices = search;
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      },
    });
  }
};

export { truckAutocompleteSearch };
export { trailerAutocompleteSearch };
