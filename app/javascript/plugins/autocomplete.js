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

const packerOutAutocompleteSearch = function() {
  const search = JSON.parse(document.getElementById('out-packers-list').dataset.packers)
  console.log(search);
  const searchInput = document.getElementById('out-packer-form');
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

const packerModalAutocompleteSearch = function() {
  console.log("hello packer autocomplete");

  const search = JSON.parse(document.getElementById('packers-list-modal').dataset.packers)
  console.log(search);
  const searchInput = document.getElementById('packer-form-modal');
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
export { packerOutAutocompleteSearch, packerAutocompleteSearch, packerModalAutocompleteSearch };

