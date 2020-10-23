<?php
	//setup variabel
	$created = \Carbon\Carbon::parse($spt->created_at);
	$approval = \Carbon\Carbon::parse($spt->created_at);
	$arr_name = explode(' ', $spt->jenis_spt_umum);
	$short_name = lcfirst($arr_name[0]);
	$i=0; 
	$dasar_spt = array_filter(explode("\n",strip_tags($spt->info_dasar_umum))); //explode by new line (ENTER)
	$dasar = '';
	
	if(count($dasar_spt)>1){
		foreach($dasar_spt as $dasar2){
			$i = $i+1;
				$dasar .= '<tr>';
				$dasar .= "<td align=\"left\" valign=\"top\" style=\"width:4%\">" . $i. ".</td>";
				$dasar .= "<td style=\"width:96%; text-align:justify\">" . $dasar2. "</td>";
				$dasar .= "</tr>";
		}
	}else{
		$dasar .= '<tr>';
		$dasar .= "<td align=\"left\" valign=\"top\" colspan=\"2\" style=\"text-align:justify\" >" . $spt->jenisSpt->dasar. ".</td>";
		$dasar .= "</tr>";
	}

	

	$nomor_spt = ($spt->nomor) ? $spt->nomor : '____';
	
	$kode_kelompok = '';
	if ($spt->jenis_spt_umum == 'Spt Umum') {
	 	$kode_kelompok = '800';
	}
	$nomor_spt = ($spt->nomor == '') ? "&nbsp;&nbsp" : $spt->nomor;
	$nomor_lampiran = "".$kode_kelompok." / ".$nomor_spt." / 438.4 / ".$created->format('Y')."";
	$header_spt = "
				<h5 ><b><u>SURAT TUGAS</u></b></h5>
				<h5 >Nomor : ".$kode_kelompok." / ".$nomor_spt." / 438.4 / ".$created->format('Y')."</h5>";
	

	//Pegawai terlampir
	$n=0;
	$user_spt = '';
		$user_spt .= "<tr>";
		$user_spt .= "<th>" ."NO". "</th>";
		$user_spt .= "<th>" ."NAMA". "</th>";
		$user_spt .= "<th>" ."NIP". "</th>";
		$user_spt .= "<th>" ."GOL". "</th>";
		$user_spt .= "<th>" ."JABATAN". "</th>";
		$user_spt .= "<th>" ."INSTANSI". "</th>";
		$user_spt .= "</tr>";
	foreach ($detail_spt as $detail){
		$n = $n+1;
		$user_spt .= "<tr>";		
		$user_spt .= "<td align=\"left\" style=\"width:4%\">" . $n. ".</td>";
		$user_spt .= "<td style=\"width:48%\">" . $detail->user->full_name_gelar. "</td>";
		// $user_spt .= "<td  style=\"width:48%\">" . $detail->peran. "</td>";
		$user_spt .= "<td style=\"width:48%\">". $detail['user']->nip ."</td>";
		$user_spt .= "<td style=\"width:48%\">". $detail['user']->pangkat ."</td>";
		$user_spt .= "<td style=\"width:48%\">". $detail['user']->jabatan ."</td>";
		$user_spt .= "<td style=\"width:48%\">". "Inspektorat Daerah" ."</td>";
		$user_spt .= "</tr>";
	}
	
?>
<!DOCTYPE html>
<html>
<head>
	<title>
		@if(isset($title))
			{{$title}}
		@else
			Inspektorat Daerah Kabupaten Sidoarjo
		@endif
	</title>
	<link href="{{ asset('assets/vendor/bootstrap/dist/css/bootstrap.min.css') }}" rel="stylesheet">
	<link href="{{ asset('css/pdf.css') }}" rel="stylesheet">
	
</head>
<body>
	<header id="header-logo">
		@include('admin.laporan.header')
	</header>

	<container>
		<div id="spt-container">		
			<div id="header-spt" style="display: block;margin: 5px auto; text-align: center; width: 45%;">			
				{!!$header_spt!!}
			</div>
			
			<div id="dasar-spt">
				<table width="100%">
					<tr>
						<td style="width:15%" valign="top">
							<table width="100%">
								<tr>
									<td>Dasar</td>
									<td align="right">:</td>
								</tr>
							</table>
						</td>
						<td style="width:85%">
							<table width="100%">{!!$dasar!!}</table>
						</td>
					</tr>
				</table>
			</div>

			<div id="pegawai-spt">
				<div class="bold center" style="line-height: 1.5">DITUGASKAN :</div>
				<table width="100%">
					<tr>
						<td style="width:15%" valign="top">
							<table width="100%">
								<tr>
									<td>Kepada</td>
									<td align="right">:</td>
								</tr>
							</table>
						</td>
						<td style="width:85%">
							<table width="100%">pegawai yg ditunjuk</table>
						</td>
					</tr>
				</table>
			</div>
			<div id="isi-spt">
				<table width="100%">
					<tr>
						<td style="width:15%" valign="top">
							<table width="100%">
								<tr>
									<td>Untuk</td>
									<td align="right">:</td>
								</tr>
							</table>
						</td>
						<td style="text-align:justify">
							<p>Melaksanakan {{$spt->info_untuk_umum}}
								
							</p>
							<!-- <p>
								Jangka waktu {{ $short_name }} selama {{ $spt->lama_hari }} kerja pada periode tanggal {{$spt->periode}}.
							</p>
							<p>Kepada pihak-pihak yang bersangkutan diminta kesediaannya untuk memberikan bantuan serta keterangan-keterangan yang diperlukan guna kelancaran dalam penyelesaian tugas yang dimaksud.</p> -->
						</td>
					</tr>
				</table>
				<!-- <table width="100%">
					<tr>
						<td style="width:15%">&nbsp;</td>
						<td style="text-align:justify">
							<p>Untuk melaksanakan 
								
								di {{$spt->lokasi_spt}} Kabupaten Sidoarjo.
								
							</p>
							<p>
								Jangka waktu {{ $short_name }} selama {{ $spt->lama_hari }} kerja pada periode tanggal {{$spt->periode}}.
							</p>
							<p>Kepada pihak-pihak yang bersangkutan diminta kesediaannya untuk memberikan bantuan serta keterangan-keterangan yang diperlukan guna kelancaran dalam penyelesaian tugas yang dimaksud.</p>
						</td>
					</tr>
				</table> -->
			</div>
			<div class="ttd-inspektur" style="clear: both;">
				<span class="tgl-ttd">Sidoarjo, ___ {{$approval->formatLocalized('%B %Y')}}</span>
				<span style="margin-left:-27px;width:10%;float:left"><b>a.n</b></span><span><b>BUPATI SIDOARJO</b></span>
				<span class="an-inspektur">INSPEKTUR</span>
				<span class="nama-inspektur"><u><b>ANDJAR SURJADIANTO, S.Sos</b></u></span>
				<span class="nip-inspektur">Pembina Utama Muda</span>
				<span class="nip-inspektur">NIP. 197009261990031005</span>
			</div>
			<div class="clear"></div>
			
	</div>
		
	</container>

	<footer>
		<!-- footer element -->
		<br>
		<div class="lampiran" style="clear: both;">
			<span class="lampiran-surat">Lampiran Surat</span><br>
			<span class="lampiran-surat">{{$nomor_lampiran}}</span><br>
			<span class="lampiran-surat">tanggal upload (sudah ttd)</span>
		</div>
		<table width="100%" boder="1">
			<tr>
				<td style="width:85% ">
					<table width="100%">{!!$user_spt!!}</table>
				</td>
			</tr>
		</table>
	</footer>

	<script src="{{ asset('assets/vendor/jquery/jquery.min.js') }}"></script>
	<script src="{{ asset('assets/vendor/bootstrap/dist/js/popper.min.js') }}"></script>
	<script src="{{ asset('assets/vendor/bootstrap/dist/js/bootstrap.min.js') }}"></script>
</body>
</html>