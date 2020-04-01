// here we list all the js functions that have to be available in the app
// those functions for instance replaceElement and listSize have to be exported
// first in their respected files in order to be available

import "bootstrap";

import { replaceElement } from '../components/replaceElements';
import { showModal } from '../components/showModal';
import { destroyModal } from '../components/showModal';
import { listSize } from '../components/listSize';
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';
import { initFlatpickr } from '../plugins/flatpickr';
import { autoSearch } from '../components/autoSearch';
import { packerAutocompleteSearch, packerModalAutocompleteSearch} from '../plugins/autocomplete';
import { inAssignmentClickCloseCreate, inAssignmentClickCloseEdit, loadinClickClose, outAssignmentClickCloseCreate, outAssignmentClickCloseEdit, loadoutClickClose } from '../components/modalForm';
import { printArea, printElement } from '../packs/print';
import { printTableFirst, printTableSecond} from '../packs/printTable';


initFlatpickr();
// listSize();

// window.listSize = listSize;
window.inAssignmentClickCloseCreate = inAssignmentClickCloseCreate ;
window.inAssignmentClickCloseEdit = inAssignmentClickCloseEdit ;
window.loadinClickClose = loadinClickClose ;
window.outAssignmentClickCloseCreate = outAssignmentClickCloseCreate ;
window.outAssignmentClickCloseEdit = outAssignmentClickCloseEdit ;
window.loadoutClickClose = loadoutClickClose ;
window.printArea = printArea;
window.printTableFirst = printTableFirst;
window.printTableSecond = printTableSecond;
window.replaceElement = replaceElement;
window.showModal = showModal;
window.destroyModal = destroyModal;
window.printElement = printElement;
window.packerModalAutocompleteSearch = packerModalAutocompleteSearch;
window.packerAutocompleteSearch = packerAutocompleteSearch;
window.initFlatpickr = initFlatpickr;
autoSearch();
packerAutocompleteSearch();
printTableFirst();
printTableSecond();




