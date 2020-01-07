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
import { packerAutocompleteSearch} from '../plugins/autocomplete';
import { inAssignmentClickCloseCreate, inAssignmentClickCloseEdit, loadinClickClose } from '../components/modalForm';
import { printArea, printElement } from '../packs/print';
import { printTable} from '../packs/printTable';


initFlatpickr();
listSize();

window.listSize = listSize;
window.inAssignmentClickCloseCreate = inAssignmentClickCloseCreate ;
window.inAssignmentClickCloseEdit = inAssignmentClickCloseEdit ;
window.loadinClickClose = loadinClickClose ;
window.printArea = printArea;
window.printTable = printTable;
window.replaceElement = replaceElement;
window.showModal = showModal;
window.destroyModal = destroyModal;
window.printElement = printElement;
autoSearch();
packerAutocompleteSearch();
printTable();




