import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const packerAutocompleteSearch = function() {
  const search = JSON.parse(document.getElementById('packers-list').dataset.packers)
  console.log(search);
  const searchInput = document.getElementById('packer-form');
  console.log(searchInput);

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


export { packerAutocompleteSearch };

