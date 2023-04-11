-- Menampilkan data member yang berada pada provinsi sumatera utara dan dalam satu kabupaten:

SELECT mm.* 
FROM mst_member mm 
JOIN mst_kabupaten mk ON mm.id_kabupaten = mk.id_kabupaten 
JOIN mst_provinsi mp ON mk.kode_propinsi = mp.kode_propinsi 
WHERE mp.nama_propinsi = 'Sumatera Utara' AND mk.nama_kabupaten = 'nama_kabupaten'

-- Menampilkan data provinsi yang tidak ada dalam data member:
SELECT * 
FROM mst_provinsi 
WHERE id_propinsi NOT IN (SELECT DISTINCT id_propinsi FROM mst_member)

-- Menampilkan data kabupaten yang tidak ada dalam data member:
SELECT * 
FROM mst_kabupaten 
WHERE id_kabupaten NOT IN (SELECT DISTINCT id_kabupaten FROM mst_member)

-- Menampilkan data kecamatan yang tidak ada dalam data member:
SELECT * 
FROM mst_kecamatan 
WHERE id_kecamatan NOT IN (SELECT DISTINCT id_kecamatan FROM mst_member)

-- Menampilkan nama member yang terdapat di Kab. Simalungun:
SELECT nama 
FROM mst_member 
JOIN mst_kabupaten ON mst_member.id_kabupaten = mst_kabupaten.id_kabupaten 
WHERE mst_kabupaten.nama_kabupaten = 'Simalungun'

-- Menampilkan jumlah data instansi pada Kab. Bireuen dan Kab. Bener Meriah:
SELECT nama_kabupaten, COUNT(*) AS jumlah_instansi
FROM mst_instansi 
JOIN mst_kabupaten ON mst_instansi.kode_kabupaten = mst_kabupaten.kode_kabupaten 
WHERE mst_kabupaten.nama_kabupaten IN ('Bireuen', 'Bener Meriah')
GROUP BY mst_kabupaten.nama_kabupaten

-- Menampilkan data member yang berawalan huruf “M”:
SELECT * 
FROM mst_member 
WHERE nama LIKE 'M%'

-- Menampilkan alamat email yang mempunyai karakter “no” dan terdapat di provinsi Sumatera Utara:
SELECT email 
FROM mst_member 
JOIN mst_provinsi ON mst_member.id_propinsi = mst_provinsi.id_propinsi 
WHERE mst_provinsi.nama_propinsi = 'Sumatera Utara' AND email LIKE '%no%'

-- Menampilkan data member yang mempunyai kode instansi “2004”:
SELECT * 
FROM mst_member 
JOIN mst_instansi ON mst_member.kode_instansi = mst_instansi.kode_instansi 
WHERE mst_instansi.kode_instansi = '2004'

-- Menampilkan data member yang mempunyai karakter kode kecamatan “.08.”:
SELECT * 
FROM mst_member 
JOIN mst_kecamatan ON mst_member.id_kecamatan = mst_kecamatan.id_kecamatan 
WHERE mst_kecamatan.kode_kecamatan LIKE '%.08.%'