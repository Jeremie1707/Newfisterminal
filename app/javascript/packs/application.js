// here we list all the js functions that have to be available in the app
// those functions for instance replaceElement and listSize have to be exported
// first in their respected files in order to be available
require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
// require("channels");

import "bootstrap";
import Chartkick from "chartkick";
import Chart from "chart.js";

import { replaceElement } from "../components/replaceElements";
import { showModal } from "../components/showModal";
import { destroyModal } from "../components/showModal";
import { listSize } from "../components/listSize";
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";

import { initFlatpickr } from "../plugins/flatpickr";
import { autoSearch } from "../components/autoSearch";
import "js-autocomplete/auto-complete.css";
import autocomplete from "js-autocomplete";
import {
  packerOutAutocompleteSearch,
  packerAutocompleteSearch,
  packerModalAutocompleteSearch,
} from "../plugins/autocomplete";
import {
  inAssignmentClickCloseCreate,
  inAssignmentClickCloseEdit,
  loadinClickClose,
  outAssignmentClickCloseCreate,
  outAssignmentClickCloseEdit,
  loadoutClickClose,
} from "../components/modalForm";
import { printTableFirst, printTableSecond } from "../packs/printTable";
// import { initChart } from '../plugins/chart';

initFlatpickr();

window.inAssignmentClickCloseCreate = inAssignmentClickCloseCreate;
window.inAssignmentClickCloseEdit = inAssignmentClickCloseEdit;
window.loadinClickClose = loadinClickClose;
window.outAssignmentClickCloseCreate = outAssignmentClickCloseCreate;
window.outAssignmentClickCloseEdit = outAssignmentClickCloseEdit;
window.loadoutClickClose = loadoutClickClose;
window.printTableFirst = printTableFirst;
window.printTableSecond = printTableSecond;
window.replaceElement = replaceElement;
window.showModal = showModal;
window.destroyModal = destroyModal;
window.packerModalAutocompleteSearch = packerModalAutocompleteSearch;
window.packerAutocompleteSearch = packerAutocompleteSearch;
window.packerOutAutocompleteSearch = packerOutAutocompleteSearch;
window.initFlatpickr = initFlatpickr;

printTableFirst();
printTableSecond();

packerAutocompleteSearch();
packerOutAutocompleteSearch();
packerModalAutocompleteSearch();
