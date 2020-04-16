import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const packerAutocompleteSearch = function() {
  if(document.getElementById('packers-list') != null) {
    const search = JSON.parse(document.getElementById('packers-list').dataset.packers);
    const searchInput = document.getElementById('packer-form');
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
    };
  };
};

const packerOutAutocompleteSearch = function() {
  if(document.getElementById('out-packers-list') != null) {
    const search = JSON.parse(document.getElementById('out-packers-list').dataset.packers);
    const searchInput = document.getElementById('out-packer-form');
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
    };
  };
};

let packerModalAutocompleteSearch = function() {
  if(document.getElementById('packers-list-modal') != null) {
    console.log('hello auto');
    let search = JSON.parse(document.getElementById('packers-list-modal').dataset.packers)
    console.log(search);
    let searchInput = document.getElementById('packer-form-modal');
    console.log(searchInput);
    if (search && searchInput) {
      console.log('ok go');
      new autocomplete({
        selector: searchInput,
        minChars: 1,
        source: function(term, suggest){
          console.log('hello function');
            term = term.toLowerCase();
            const choices = search;
            const matches = [];
            for (let i = 0; i < choices.length; i++)
                if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
            suggest(matches);
        },
      });
    };
  };
};
export { packerOutAutocompleteSearch, packerAutocompleteSearch, packerModalAutocompleteSearch };

