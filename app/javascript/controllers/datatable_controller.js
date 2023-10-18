import $ from 'jquery';
import jsZip from 'jszip';
import DataTable from 'datatables.net';
import 'datatables.net-buttons';
import 'datatables.net-buttons-dt';
window.JSZip = jsZip;
import { Controller } from '@hotwired/stimulus'


export default class extends Controller {
  connect () {
    document.addEventListener('DOMContentLoaded', function () {
      $('#dttb').DataTable({
        dom: 'Bfrtip',
        language: {
          search: "_INPUT_",
          searchPlaceholder: "Search..."
        },
        //add custom button
        initComplete: function () {
          $('.dt-buttons').prepend('<button class="bi bi-tv" id="btn-card"></button>');
          $('.dt-buttons').prepend('<button class="bi bi-list" id="btn-card2"></button>');
          $('#btn-card').on("click", function () {
            if ($("#dttb").hasClass("card")) {
                    $(".colHeader").remove();
                    $(".ic").remove();                    
            } 
            else {
                  var labels = [];
                  $("#dttb thead th").each(function () {
                    labels.push($(this).text());
                  });
                  $("#dttb tbody tr").each(function () {
                    $(this).find("td").each(function (column) {
                      $(labels[column]).prependTo(
                        $(this)
                      );
                    });
                  });
            }
          $('#dttb').toggleClass('card');
          });
        }
      });
    });
  }
} 


