// here we list all the js functions that have to be available in the app
// those functions for instance replaceElement and listSize have to be exported
// first in their respected files in order to be available

import "bootstrap";

import { replaceElement } from '../components/replaceElements';
import { listSize } from '../components/listSize';
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';
import { initFlatpickr } from '../plugins/flatpickr';
import { autoSearch } from '../components/autoSearch';
import { packerAutocompleteSearch} from '../plugins/autocomplete';

initFlatpickr();
listSize();
window.listSize = listSize;
window.replaceElement = replaceElement;
autoSearch();
packerAutocompleteSearch();



