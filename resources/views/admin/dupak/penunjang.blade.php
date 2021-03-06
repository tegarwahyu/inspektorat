<script type="text/javascript">
//start generate tabel penunjang

function generate_tabel_penunjang(){
    var user_id = ( $( "#user-id" ).length ) ? $("#user-id option:selected").val() : "{{ Auth::user()->id }}";
    var semester = $('#semester option:selected').val();
    var tahun = $('#tahun').val();
    var periode = (semester == 1) ? '1 Januari - 30 Juni' : '1 Juli - 31 Desember';
    $.ajax({
    url: '{{ route("data_dupak_penunjang") }}',
    type: 'GET',
    data: {user_id: user_id, semester: semester, tahun: tahun},
    success: function (response) { 
	    //console.log(response);
      var header = generate_header(response.user, response.pejabat, 'Penunjang Pengawasan');
      var footer = generate_footer(response.user, response.pejabat);
      var table = '<table class="table table-sm table-bordered ajax-table col-print-12 table-print-border" id="dupak-penunjang-table">';
      table += '<tr style="background: #ccc; text-align: center">'
                +'<th rowspan="2">No.</th>'
                +'<th colspan="2">Uraian Kegiatan</th>'
                +'<th rowspan="2">Tanggal</th>'
                +'<th rowspan="2">Satuan AK</th>'
                +'<th rowspan="2">Jumlah Jam</th>'
                +'<th rowspan="2">Jumlah AK</th>'
                +'<th rowspan="2">Keterangan</th>'
              +'</tr>'
              +'<tr style="background: #ccc; text-align: center">'
                  +'<th>Kode</th>'
                  +'<th>Kegiatan</th>'
              +'</tr>'
              //nomor tabel
              +'<tr style="background: #ccc; text-align: center">'
                  +'<th>1</th>'
                  +'<th>2</th>'
                  +'<th>3</th>'
                  +'<th>4</th>'
                  +'<th>5</th>'
                  +'<th>6</th>'
                  +'<th>7</th>'
                  +'<th>8</th>'
              +'</tr>';
      var sumPenunjang=0, sumLamaPenunjang=0, sumLamaJamPenunjang=0;
      //if response ak has data
      if(response.ak.length>0){
      var year = new Date().getFullYear();
       $.each(response.ak, function (i, item) {
          var n = i+1;            
              table += '<tr>'
              +'<td >' + n + '</td>'
              +'<td></td>'
              +'<td>'+ item.spt_umum.info_untuk_umum+'</td>'
              //+'<td>' + item.spt.periode + '<br />' + item.spt.lama + '</td>'
              +'<td style="text-align: center;">' + item.spt_umum.periode + '</td>'
              +'<td style="text-align: center">'+ item.info_dupak.koefisien +'</td>'
              +'<td style="text-align: center">'+ item.info_dupak.lama_jam +'</td>' 
              +'<td style="text-align: center">'+ item.info_dupak.dupak +'</td>'
              +'<td>'+ item.peran +'<br/><br/></td>'
              +'</tr>';
          sumPenunjang += parseFloat(item.info_dupak.dupak);
          sumLamaPenunjang += parseInt(item.spt_umum.lama);
          sumLamaJamPenunjang += parseFloat(item.info_dupak.lama_jam)
        });
      }else{
        table += '<tr style="height:300px;">'
              +'<td ></td>'
              +'<td></td>'
              +'<td></td>'
              +'<td style="text-align: center;"></td>'
              +'<td style="text-align: center"></td>'
              +'<td style="text-align: center"></td>' 
              +'<td style="text-align: center"></td>'
              +'<td></td>'
              +'</tr>';
      }
      table += '<tr style="text-align:center; font-weight: bold;">'
              +'<td ></td>'
              +'<td></td>'
              +'<td>JUMLAH</td>'
              +'<td>'+sumLamaPenunjang+'</td>'
              +'<td></td>'
              +'<td>'+sumLamaJamPenunjang+'</td>' 
              +'<td>'+sumPenunjang.toFixed(3)+'</td>'
              +'<td></td>'
              +'</tr>';
       table += '</table>';
       $( "#dupak-penunjang-wrapper" ).html(header+table+footer);
    }
  });
  }
//end generate tabel penunjang
</script>