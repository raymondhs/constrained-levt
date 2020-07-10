Summary
==== 

This is an extended summary of the ["Lexically Constrained Neural Machine Translation with Levenshtein Transformer"](https://www.aclweb.org/anthology/2020.acl-main.325/) paper published in ACL 2020. We have provided multilingual summaries for our work as follows:

**Languages**

 - [Summary (English)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#summary-english)
 - [概要 (Japanese)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#%E6%A6%82%E8%A6%81-japanese)
 - [Ringkasan (Indonesian)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#ringkasan-indonesian)
 - [സംഗ്രഹം (Malayalam)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#%E0%B4%B8%E0%B4%82%E0%B4%97%E0%B5%8D%E0%B4%B0%E0%B4%B9%E0%B4%82-malayalam)
 - [சுருக்கம் (Tamil)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#%E0%AE%9A%E0%AF%81%E0%AE%B0%E0%AF%81%E0%AE%95%E0%AF%8D%E0%AE%95%E0%AE%AE%E0%AF%8D-tamil)
 - [सारांश (Hindi)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#%E0%A4%B8%E0%A4%BE%E0%A4%B0%E0%A4%BE%E0%A4%82%E0%A4%B6-hindi)
 - [摘要 (Simplified Chinese)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#%E6%91%98%E8%A6%81-chinese)
 - [摘要 (Traditional Chinese - Hong Kong)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#%E6%91%98%E8%A6%81-traditional-chinese---hong-kong)
 - [摘要 (Traditional Chinese - Taiwan)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#%E6%91%98%E8%A6%81-traditional-chinese---taiwan)
 - [요약 (Korean)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#%EC%9A%94%EC%95%BD-korean)
 - [Tóm lược (Vietnamese)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#t%C3%B3m-l%C6%B0%E1%BB%A3c-vietnamese)
 

# Summary (English)

People want to communicate in their native languages and machine translation has been ubiquitously integrated to different parts of our virtual interactions. At Rakuten, we use machine translation technology extensively to empower people and businesses to translate content to reach users globally. 


<p align="center">
  <img width="460" height="235" src="https://docs.google.com/drawings/d/e/2PACX-1vSIl6spYocxL4gmqoHvr7jmaVh139TtOPOtH6LcpKqUvo6q8UddtsjHYDIsjelNLk32OLitMpKCN2cZ/pub?w=409&h=201">
</p>

Often, machine translation (MT) needs to be augmented with custom dictionaries to get the desired results. For example, the Chinese phrase "紅米" (hóng mǐ) literally translates to red rice. However, 紅米 can also refer to the smartphone brand, Redmi. In the case of e-commerce domain, one may want to constrain the MT model to translate 紅米 as Redmi instead of red rice.

### Lexically constrained Levenshtein Transformer

In our ACL 2020 paper, "Lexically constrained neural machine translation with Levenshtein Transformer", we describe our effort to improve dictionary-augmented (aka. lexically constrained) NMT. Gu et al. (2019) introduced the Levenshtein Transformer (LevT) model that generates the target words simultaneously and thereafter iteratively delete or add new words. This is opposed to the popular paradigm of employing auto-regressive NMT models that generate translated words one at a time.

<p align="center">
  <img width="420" height="400" src="https://docs.google.com/drawings/d/e/2PACX-1vT9lxJez7xsM0hYKB_MyrqW48QYB0GHsT2cMSxEvq4-zMmbYUBycmj9lbd4DX8mcvWTLjUqM9olr238/pub?w=432&h=385">
</p>


We extend LevT to enforce the dictionary translations by inserting the dictionary term translations before the generation and letting the model make decisions to add or delete words around these dictionary terms to generate the final translation. We refer to this step as the constraint insertion step. We can further disallow deletion and insertion operations on these constraint tokens to make sure that they faithfully appear in the translation output. Since this step happens only at inference, our model doesn't need to be re-trained given new custom dictionaries.

### Higher term usage, higher translation quality 

Our experiments on Workshop on Machine Translation (WMT) 2014 English to German translation benchmark show that this simple approach can guarantee 100% dictionary term usage (Term%) without harming the translation quality (in terms of BLEU) or decoding speed.

<p align="center">
  <img width="460" height="320" src="https://docs.google.com/drawings/d/e/2PACX-1vSaIOrbdOIYLax-cRLrMtM3Q3h6RzQwzrmGD2iDmpBJYrtPIHKXMb7dOOmCArwxCr46JbaSil3Rrh8f/pub?w=1035&h=664">
</p>

We also compare with previous approaches on lexically constrained NMT, such as Post and Vilar (2018) and Dinu et al. (2019), on their released annotated version of the WMT'17 news test set. Unlike our approach,  approaches either failed to guarantee the dictionary term usage or have sacrificed translation speed substantially to enforce the term usage. 

<p align="center">
  <img width="460" height="240" src="https://docs.google.com/drawings/d/e/2PACX-1vQZ3MwMb_qps53Nn9N7HMPakW9uFKfhH-MEJjaASZg-xtwhb2WaS-e0dz-rS3LFHA-R7M7AL0ahU89w/pub?w=1396&h=645">
</p>

### What's next?

Our approach has successfully addressed a very niche, yet an important problem in MT: dictionary-aware translation. Non-autoregressive decoding, such as LevT in our work, is one cutting-edge research topic in NMT. We believe that our lexical constraint approach will benefit from future improvement in the LevT architecture itself. One direction we would be excited to explore is related to word reordering, as it has been pointed by critical researchers we met throughout the ACL-2020 conference. Another interesting direction is to explore various constraint selection strategies, which potentially can handle morphological variants of the constraints.

### References

Matt Post and David Vilar. 2018. Fast Lexically Constrained Decoding with Dynamic Beam Allocation for Neural Machine Translation. In Proceedings of the 2018 Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, Volume 1 (Long Papers).

Georgiana Dinu, Prashant Mathur, Marcello Federico, Yaser Al-Onaizan. 2019. Training Neural Machine Translation to Apply Terminology Constraints. In Proceedings of the 57th Annual Meeting of the Association for Computational Linguistics.

Jiatao Gu, Changhan Wang, and Junbo Zhao. 2019. Levenshtein transformer. In Advances in Neural Information Processing Systems 32.


[Return to top](https://github.com/raymondhs/constrained-levt/blob/master/summary.md)

# 概要 (Japanese)

人は母国語でコミュニケーションを取りたいと考えており、機械翻訳はバーチャルなやり取りのさまざまな部分のいたるところに組み込まれています。楽天では、機械翻訳技術を幅広く活用し、人々や企業がコンテンツを翻訳して世界中のユーザーにリーチできるようにしています。

多くの場合、機械翻訳（MT）は、目的の結果を得るためにカスタム辞書で補強する必要があります。たとえば、中国語の「紅米」というフレーズ (hóng mǐ)は文字通り「赤米」を意味します。しかし、紅米はスマートフォンのブランドである「Redmi」を指すこともあります。eコマース領域の場合、MTモデルを制約して、「紅米」を「赤米」ではなく「Redmi」と訳すこともできます。

### 語彙的に制約されたLevenshtein Transformer

私たちのACL 2020論文「Lexically constrained neural machine translation with Levenshtein Transformer」では、辞書的に制約された（語彙的に制約された）NMTを改善するための私たちの取り組みについて述べています。Guら（2019）は、対象となる単語を同時に生成し、その後反復的に新しい単語を削除または追加するLevenshtein Transformer（LevT）モデルを導入しました。これは、翻訳された単語を一度に一つずつ生成する自動回帰型NMTモデルを採用する一般的なパラダイムとは対照的です。

私たちは、生成前に辞書用語の翻訳を挿入し、最終的な翻訳を生成するためにこれらの辞書用語の周囲の単語を追加または削除するかどうかをモデルに決定させることで、辞書翻訳を強制するためにLevTを拡張します。このステップを制約挿入ステップと呼びます。翻訳出力に忠実に表示されるようにするために、これらの制約トークンに対する削除や挿入操作をさらに禁止することができます。このステップは推論時にのみ発生するため、新しいカスタム辞書を使ってモデルに再学習させる必要はありません。

### 用語の使用率が高く、翻訳品質が高い 

「Workshop on Machine Translation (WMT) 2014」の英語からドイツ語への翻訳に関する私たちの実験では、この単純なアプローチで、翻訳の品質やスピードを損なうことなく、100%の辞書用語の使用を保証できることが示されています。

私たちはまた、Post＆Vilar (2018)やDinuら(2019)のようにリリースされた注釈付きバージョンのWMT'17ニューステストセットを用いた。語彙的に制約されたNMTに関する以前のアプローチと比較しました。私たちのアプローチとは異なり、どちらのアプローチも用語の使用法を保証することに失敗したか、あるいは用語の使用法を強制するために翻訳速度を大幅に犠牲にしていました。

### 次のステップは？

私たちのアプローチは、MTにおける非常にニッチでありながら重要な問題である辞書認識翻訳に成功しました。私たちの作業におけるLevTのような非自己回帰デコーディングは、NMTにおける最先端の研究テーマの一つです。私たちの語彙制約アプローチは、LevTアーキテクチャ自体の将来的な改善から恩恵を受けることができると考えています。ACL-2020会議でお会いした重要な研究者の方々から指摘されているように、単語の並び替えに関連した研究を進めていきたいと考えています。もう一つの興味深い方向は、様々な制約の選択戦略を探求することであり、これには潜在的に制約の形態論的バリエーションを扱うことができる可能性があります。

[Return to top](https://github.com/raymondhs/constrained-levt/blob/master/summary.md)

# Ringkasan (Indonesian)

Orang ingin berkomunikasi dalam bahasa ibu mereka dan terjemahan mesin telah terintegrasi secara menyeluruh ke berbagai bagian interaksi virtual kita. Di Rakuten, kami menggunakan teknologi terjemahan mesin secara ekstensif untuk memberdayakan orang dan bisnis dalam menerjemahkan konten sehingga dapat menjangkau pengguna global.

Seringkali, terjemahan mesin (MT) perlu diperkaya dengan kamus sesuai kebutuhan untuk mendapatkan hasil yang diinginkan. Sebagai contoh, frasa bahasa China yang berbunyi  "紅米" (hóng mǐ)  secara harfiah terjemahannya adalah beras merah. Namun, 紅米 juga bisa merujuk pada merek ponsel pintar, Redmi. Dalam lingkup perdagangan elektronik, kita mungkin ingin membatasi model MT untuk menerjemahkan 紅米 menjadi Redmi alih-alih beras merah.

### Transformator Levenshtein terbatasi Leksikal

Dalam makalah ACL 2020 kami, "Lexically constrained neural machine translation with Levenshtein Transformer", (Terjemahan mesin neural terbatasi leksikal dengan Transformator Lvenshtein) kami menjelaskan upaya kami untuk meningkatkan NMT yang diperkaya dengan kamus (dengan kata lain, dibatasi secara leksikal). Gu dkk. (2019) memperkenalkan model Transformator Levenshtein (LevT) yang menghasilkan kata-kata target secara simultan dan selanjutnya menghapus atau menambahkan kata-kata baru secara iteratif. Ini berbeda dengan paradigma populer yang menjalankan model NMT auto-regresif, yang menghasilkan kata-kata terjemahan satu per satu.

Kami memperluas LevT untuk memaksakan terjemahan kamus dengan menyisipkan terjemahan istilah kamus sebelum penyusunan dan membiarkan model membuat keputusan untuk menambah atau menghapus kata-kata di sekitar istilah dari kamus ini dalam menghasilkan terjemahan akhir. Kami menyebut langkah ini sebagai langkah penyisipan batasan. Kami bisa lebih jauh menghalangi operasi penghapusan dan penyisipan pada token-token pembatasan ini untuk memastikan agar mereka benar-benar muncul di hasil terjemahan. Karena langkah ini hanya dilakukan pada tahap inferensi, model kami tidak perlu dilatih ulang jika diberikan kamus baru.

### Makin banyak penggunaan istilah, makin tinggi kualitas terjemahan

Percobaan kami pada Workshop Terjemahan Mesin (WMT) 2014 untuk terjemahan bahasa Inggris ke Jerman menunjukkan bahwa pendekatan sederhana ini dapat menjamin penggunaan 100% istilah kamus tanpa mengurangi kualitas terjemahan atau kecepatan penerjemahan.

Kami juga membandingkan dengan pendekatan sebelumnya untuk NMT yang dibatasi secara leksikal, seperti dari Post dan Vilar (2018) dan Dinu dkk. (2019), pada versi teranotasi yang mereka rilis untuk set uji berita WMT'17. Tidak seperti pendekatan kami, kedua pendekatan itu gagal menjamin penggunaan istilah atau mengorbankan secara substansial kecepatan terjemahan untuk memaksakan penggunaan istilah.

### Apa langkah selanjutnya?

Pendekatan kami telah berhasil menangani sebuah ceruk kecil, namun sangat penting dalam MT: terjemahan sadar-kamus. Proses dekode non-otoregresif, seperti LevT dalam karya kami, adalah salah satu topik penelitian mutakhir dalam bidang NMT. Kami percaya bahwa pendekatan batasan leksikal kami akan mendapat manfaat dari perbaikan di masa mendatang dalam arsitektur LevT. Satu arah yang sangat ingin kami eksplorasi adalah terkait penyusunan kembali urutan kata, karena hal itu telah ditunjukkan oleh banyak peneliti kritis yang kami jumpai di konferensi ACL-2020. Arah menarik lain adalah untuk menjelajahi berbagai strategi pemilihan batasan, yang secara potensial dapat menangani varian morfologis dari batasan tersebut.

[Return to top](https://github.com/raymondhs/constrained-levt/blob/master/summary.md)

# സംഗ്രഹം (Malayalam)

ആളുകൾ‌ക്ക് അവരുടെ മാതൃഭാഷകളിൽ‌ ആശയവിനിമയം നടത്താനാണ് താല്‍‌പ്പര്യം, കൂടാതെ ഞങ്ങളുടെ വിർ‌ച്വൽ‌ ഇടപെടലുകളുടെ വിവിധ ഭാഗങ്ങളുമായി  മെഷീന്‍ ട്രാന്‍സ്ലേഷന്‍ സർവ്വത്രികമായി സംയോജിപ്പിച്ചിട്ടുമുണ്ട് രാകുടേനില്‍, ഞങ്ങള്‍ ആഗോളതലത്തിൽ ഉപയോക്താക്കളിലേക്ക് കൂടുതലായി  എത്തിച്ചേരാനായി ഉള്ളടക്കം വിവർത്തനത്തിന് ആളുകളെയും ബിസിനസ്സുകളെയും ശാക്തീകരിക്കുന്നതിനായി  ഞങ്ങൾ മെഷീൻ ട്രാന്‍സ്ലേഷന്‍  വിപുലമായി ഉപയോഗിക്കുന്നു.

മിക്കപ്പോഴും,  ഉദ്ദേശിക്കുന്ന ഫലം ലഭിക്കുന്നതിന് മെഷീൻ ട്രാൻസ്ലേഷൻ (എംടി) ഇഷ്‌ടാനുസൃത നിഘണ്ടുക്കളോടൊപ്പം അനുബന്ധിതമാക്കേണ്ടതായി വരുന്നു ഉദാഹരണത്തിന്, "紅 米" (hóng mǐ) എന്ന ചൈനീസ് വാക്യം അക്ഷരാർത്ഥത്തിൽ ചുവന്ന അരി എന്നാണ് വിവര്‍ത്തനം ചെയ്യാവുന്നത്. എന്നിരുന്നാലും, 紅米 കൊണ്ട് സ്മാർട്ട്‌ഫോൺ ബ്രാൻഡായ റെഡ്‍മിയെയും പരാമർശിക്കാം ഇ-കൊമേഴ്‌സ് ഡൊമെയ്‌നില്‍, ചുവന്ന അരിക്ക് പകരം  റെഡ്‍മി എന്ന് വിവർത്തനം ചെയ്യുന്നതിന് എംടി മോഡലിനെ ക്രമീകരിക്കേണ്ടത് അനിവാര്യമാണ്.


### ലെക്സിക്കലി കണ്‍സ്ട്രെയിന്‍ഡ് ‌സ്റ്റൈൻ‌ ലെവൻ‌സ്റ്റൈൻ‌ ട്രാൻ‌സ്‌ഫോർമർ

"ലെവൻ ‌സ്റ്റൈൻ‌ ട്രാൻ‌സ്‌ഫോർമറിലൂടെയുള്ള ലെക്സിക്കലി കണ്‍സ്ട്രെയിന്‍ഡ്  ന്യൂറൽ‌ മെഷീൻ‌ ട്രാന്‍സ്ലേഷന്‍", എന്ന ഞങ്ങളുടെ എസി‌എൽ 2020 പേപ്പറില്‍  നിഘണ്ടു-അനുബന്ധിതമാക്കിയ (ലെക്സിക്കലി കണ്‍സ്ട്രെയിന്‍ഡ് എന്നും ഇത്  അറിയപ്പെടുന്നു) എന്‍ എംടിയെ കുറിച്ച് വിശദീകരിക്കുന്നുണ്ട്. ഗു എറ്റ് അല്‍. (2019)  ലക്ഷ്യമിടുന്നതായ പദങ്ങൾ‌ ഒരേസമയം സൃഷ്ടിക്കപ്പെടുകയും തുടർന്ന്‌ ആവർത്തിച്ച് ഇല്ലാതാക്കപ്പെടുകയോ അല്ലെങ്കിൽ‌ പുതിയ പദങ്ങൾ‌ ചേർ‌ക്കപ്പെടുകയോ ചെയ്യുന്ന ലെവൻ‌സ്റ്റൈൻ‌ ട്രാൻ‌സ്‌ഫോർമർ‌ (ലെവിടി) മോഡൽ‌ അവതരിപ്പിച്ചു.  ഒരു സമയം വിവർത്തനം ചെയ്ത ഒരു  വാക്ക് സൃഷ്ടിക്കുന്ന ഓട്ടോ-റിഗ്രസീവ് എൻ‌എം‌ടി മോഡലുകൾ‌ ഉപയോഗിക്കുന്നതിനുള്ള ജനപ്രിയ മാതൃകക്ക് എതിരാണ് ഇത്.

 അന്തിമ വിവർത്തനം സൃഷ്ടിക്കുന്നതിന് ഈ നിഘണ്ടു പദങ്ങൾക്ക് ചുറ്റുമുള്ള വാക്കുകൾ ചേർക്കാനോ ഇല്ലാതാക്കാനോ തീരുമാനമെടുക്കാൻ മോഡലിനെ അനുവദിക്കുന്നതിനായി  നിഘണ്ടു വിവർത്തനങ്ങൾ നടപ്പിലാക്കുന്നതിന്   നിഘണ്ടു പദ വിവർത്തനങ്ങൾ ഉൾപ്പെടുത്തിക്കൊണ്ട് ഞങ്ങൾ ലെവ്‍ടിയെ വിപുലീകരിക്കുകയും ചെയ്തു ഈ ഘട്ടത്തെ  കണ്‍സ്ട്രെയിന്‍ഡ് ഇന്‍സെര്‍ഷന്‍  സ്റ്റെപ്പ് അഥവാ  നിയന്ത്രിത ഉൾപ്പെടുത്തൽ ഘട്ടമായി ഞങ്ങൾ പരാമർശിക്കുന്നു. വിവർത്തന ഉല്‍പന്നത്തിൽ അവ വിശ്വസ്തതയോടെ ദൃശ്യമാകുന്നുവെന്ന് ഉറപ്പാക്കുന്നതിന് ഈ നിയന്ത്രണ    സൂചകങ്ങളിൽ ഇല്ലാതാക്കല്‍, ഉൾപ്പെടുത്തൽ പ്രവർത്തനങ്ങള്‍  അനുവദിക്കാതിരിക്കാനും ഞങ്ങൾക്ക് സാധിക്കും  അനുമാനത്തിൽ മാത്രമേ ഈ ഘട്ടം സംഭവിക്കുകയുള്ളൂ എന്നതിനാൽ, പുതിയ ഇഷ്‌ടാനുസൃത നിഘണ്ടുക്കൾ നൽകി ഞങ്ങളുടെ മോഡലിന് വീണ്ടും പരിശീലനം നൽകേണ്ട ആവശ്യമില്ല.

### ഉയർന്ന പദ ഉപയോഗം, ഉയർന്ന വിവർത്തന നിലവാരം

മെഷീൻ ട്രാൻസ്ലേഷൻ (ഡബ്ല്യുഎംടി) 2014 ലെ ഇംഗ്ലീഷ് - ജര്‍മ്മന്‍ വിവര്‍ത്തനത്തിന്‍റെ മാനദണ്ഡത്തില്‍ നടത്തിയ  വർക്ക് ‍ഷോപ്പിനെക്കുറിച്ചുള്ള ഞങ്ങളുടെ പരീക്ഷണങ്ങൾ കാണിക്കുന്നത്, വിവർത്തന ഗുണനിലവാരത്തെ (BLEU അടിസ്ഥാനത്തില്‍ ) അല്ലെങ്കിൽ ഡീകോഡിംഗ് വേഗതയെ ദോഷകരമായി ബാധിക്കാതെ തന്നെ ഈ ലളിതമായ സമീപനത്തിന് 100% നിഘണ്ടു പദ ഉപയോഗം (ടേം%) ഉറപ്പുനൽകാൻ കഴിയുമെന്നാണ്.

  ഡബ്ല്യുഎംടി'17 ന്യൂസ് ടെസ്റ്റ് സെറ്റിന്റെ പുറത്തിറക്കിയ വ്യാഖ്യാന പതിപ്പിൽ പോസ്റ്റ് ആന്‍ഡ്   വിലാർ (2018),ഡിനു എറ്റ് അല്‍  (2019), തുടങ്ങിയ  ലെക്‌സിക്കലി കണ്‍സ്‍ട്രെയിന്‍ഡ്   എൻ‌എം‌ടിയുടെ മുന്‍ സമീപനങ്ങളുമായി ഞങ്ങൾ ഇത് താരതമ്യം ചെയ്യുകയും ചെയ്യുന്നു. ഞങ്ങളുടെ സമീപനത്തിൽ നിന്ന് വ്യത്യസ്തമായി, നിഘണ്ടു പദ  ഉപയോഗം ഉറപ്പുനൽകുന്നതിൽ ഈ സമീപനങ്ങൾ പരാജയപ്പെടുകയോ അല്ലെങ്കിൽ  പദ ഉപയോഗം നടപ്പിലാക്കുന്നതിനായി വിവർത്തന വേഗത ഗണ്യമായി ത്യജിക്കേണ്ടി വരികയോ ഉണ്ടായി.

### അടുത്തത് എന്താണ്?

ഞങ്ങളുടെ സമീപനം വളരെ പ്രധാനപ്പെട്ട ഒരു സാഹചര്യത്തെ, എംടിയിലെ ഒരു പ്രധാന പ്രശ്നത്തെ വിജയകരമായി അഭിസംബോധന ചെയ്തു, അതായത് നിഘണ്ടു-അവബോധ വിവർത്തനത്തെ. ഞങ്ങളുടെ ജോലികളിലെ ലെവ്ടി‍ പോലുള്ള നോൺ-ഓട്ടോറെഗ്രസീവ് ഡീകോഡിംഗ്എ, ൻ‌എം‌ടിയിലെ ഒരു പ്രധാന ഗവേഷണ വിഷയമാണ്.  ലെവ്‍ടി ആര്‍ക്കിടെക്‍ച റിന്‍റെ   ഭാവിയില്‍ നടക്കാവുന്ന മെച്ചപ്പെടുത്തലിൽ നിന്ന് ഞങ്ങളുടെ ലെക്സിക്കൽ  കണ്‍സ്‍ട്രെയിന്‍റ് സമീപനം  ഗുണം  ചെയ്യുമെന്ന് ഞങ്ങൾ വിശ്വസിക്കുന്നു. എസി‌എൽ -2020 സമ്മേളനത്തിലുടനീളം ഞങ്ങൾ കണ്ടുമുട്ടിയ നിരൂപക  ഗവേഷകർ ചൂണ്ടിക്കാണിച്ചതുപോലെ,  പര്യവേക്ഷണം ചെയ്യാൻ ഞങ്ങളെ ആവേശഭരിതരാക്കുന്ന ഒരു  നിര്‍ദ്ദേശം  ഞങ്ങള്‍ക്ക് ലഭിച്ചത് വാക്കുകളുടെ  പുന:ക്രമീകരണവുമായി ബന്ധപ്പെട്ടതാണ്. മറ്റൊരു രസകരമായ നിര്‍ദ്ദേശം , വിവിധ കണ്‍സ്ട്രെയിന്‍റ് സെലക്ഷന്‍  തന്ത്രങ്ങൾ പര്യവേക്ഷണം ചെയ്യുക എന്നതാണ്, ഇത് പരിമിതികളുടെ രൂപാന്തരപരമായ വകഭേദങ്ങളെ  കൈകാര്യം ചെയ്യാൻ  നമ്മളെ പ്രാപ്തമാക്കിയേക്കാം.

[Return to top](https://github.com/raymondhs/constrained-levt/blob/master/summary.md)

# சுருக்கம் (Tamil)

மக்கள் தங்கள் சொந்த மொழிகளில் தொடர்பு கொள்ள விரும்புகிறார்கள், மேலும் இயந்திர மொழிபெயர்ப்பு எங்கள் மெய்நிகர் தொடர்புகளின் வெவ்வேறு பகுதிகள் முழுவதிலும் ஒருங்கிணைக்கப்பட்டுள்ளது. ரகுடனில், உலகளவிலான பயனர்களைச் சென்றடைய, உள்ளடக்கத்தை மொழிபெயர்க்க, வணிகர்களுக்கும் வணிகங்களுக்கும் அதிகாரம் அளிக்க இயந்திர மொழிபெயர்ப்பு தொழில்நுட்பத்தை நாங்கள் விரிவாகப் பயன்படுத்துகிறோம்.

பெரும்பாலும், விரும்பிய முடிவுகளைப் பெற இயந்திர மொழிபெயர்ப்பை (எம்டி) தனிப்பயன் அகராதிகளுடன் இணைக்க வேண்டும். எடுத்துக்காட்டாக, "紅 米" (hóng mǐ) என்ற சீன சொற்றொடரின் நேரடி அர்த்தம் சிவப்பு அரிசி என்பதாகும். இருப்பினும், 紅米 என்பது ஸ்மார்ட்போன் பிராண்டான ரெட்மியையும் குறிக்கலாம். ஈ-காமர்ஸ் டொமைனைப் பொறுத்தவரை,  紅米 என்பதை சிவப்பு அரிசி என்பதற்குப் பதிலாக ரெட்மி என்று மொழிபெயர்க்க எம்டி மாதிரியைக் கட்டுப்படுத்த ஒருவர் விரும்பலாம்.

### லெக்சிக் முறையில் கட்டுப்படுத்தப்பட்ட லெவன்ஸ்டீன் டிரான்ஸ்ஃபார்மர்

எங்கள் ACL 2020 தாளில், "லெவன்ஸ்டைன் டிரான்ஸ்ஃபார்மருடன் லெக்சிகல் முறையில் கட்டுப்படுத்தப்பட்ட நரம்பியல் இயந்திர மொழிபெயர்ப்பு", அகராதியில் இணைக்கப்பட்ட (அதாவது லெக்சிகல் முறையில் கட்டுப்படுத்தப்பட்ட) என்எம்டியை மேம்படுத்துவதற்கான எங்கள் முயற்சியை நாங்கள் விவரிக்கிறோம். கு மற்றும் பலர். (2019) லெவன்ஸ்டைன் டிரான்ஸ்ஃபார்மர் (LevT) மாதிரியை அறிமுகப்படுத்தினர், இது இலக்கு சொற்களை ஒரே நேரத்தில் உருவாக்குகிறது, அதன்பிறகு மீள்செய்கை முறையில் புதிய சொற்களை நீக்குகிறது அல்லது சேர்க்கிறது. மொழிபெயர்க்கப்பட்ட சொற்களை ஒரே நேரத்தில் உருவாக்கும் தானியங்கு-பிற்போக்கு என்எம்டி மாதிரிகளைப் பயன்படுத்துவதற்கான பிரபலமான முன்னுதாரணத்திற்கு இது எதிரானது.


அகராதிச் சொல் மொழிபெயர்ப்புகளை உருவாக்கத்தின் முன் உள்ளிடுவதன் மூலமும், இறுதி மொழிபெயர்ப்பை உருவாக்க இந்த அகராதி சொற்களைச் சுற்றியுள்ள சொற்களைச் சேர்க்க அல்லது நீக்குவதற்கான முடிவுகளை எடுக்க மாதிரியை அனுமதிப்பதன் மூலமும் அகராதி மொழிபெயர்ப்புகளைச் செயல்படுத்த நாங்கள் LevT யை விரிவுபடுத்துகிறோம். இந்த படிநிலையை கட்டுப்பாட்டு உள்ளிடுதல் படிநிலை என்று குறிப்பிடுகிறோம். மொழிபெயர்ப்பு வெளியீட்டில் அவை உண்மையாகத் தோன்றுவதை உறுதிசெய்ய இந்த கட்டுப்பாட்டு டோக்கன்களில் நீக்குதல் மற்றும் உள்ளிடுதல் செயல்பாடுகளை நாங்கள் மேலும் அனுமதிக்க மறுக்கலாம். இந்தப் படிநிலை அனுமானத்தில் மட்டுமே நடப்பதால், புதிய தனிப்பயன் அகராதிகள் கொடுக்கப்பட்டால், எங்கள் மாதிரி மீண்டும் பயிற்சி பெற தேவையில்லை.

### உயர் சொல் பயன்பாடு, அதிக மொழிபெயர்ப்பு தரம்

இயந்திர மொழிபெயர்ப்பு மீதான பணிப்பட்டறை (WMT) 2014 இன் ஆங்கிலம் முதல் ஜெர்மன் மொழிபெயர்ப்பு குறித்த எங்கள் சோதனைகள், இந்த எளிய அணுகுமுறையானது, மொழிபெயர்ப்புத் தரம் அல்லது வேகத்திற்கு தீங்கு விளைவிக்காமல் 100% அகராதி சொல் பயன்பாட்டிற்கு உத்தரவாதம் அளிக்க முடியும் என்பதைக் காட்டுகிறது.

போஸ்ட் மற்றும் விலார் (2018) மற்றும் டினு மற்றும் பலர்  (2019), போன்ற WMT'17 செய்தி சோதனை தொகுப்பின் வெளியிடப்பட்ட சிறுகுறிப்பு பதிப்பில் லெக்சிகல் முறையில் கட்டுப்படுத்தப்பட்ட என்எம்டியின் முந்தைய அணுகுமுறைகளுடனும் ஒப்பிடுகிறோம். எங்கள் அணுகுமுறையைப் போலன்றி, இந்த இரு அணுகுமுறைகளும் சொல் பயன்பாட்டை உத்தரவாதம் செய்வதில் தோல்வியுற்றன அல்லது சொல் பயன்பாட்டிற்காக மொழிபெயர்ப்பு வேகத்தை கணிசமாகத் தியாகம் செய்துள்ளன.

### அடுத்தது என்ன?

எங்கள் அணுகுமுறை வெற்றிகரமாக ஒரு முக்கிய வெற்றிடத்தை நிவர்த்தி செய்துள்ளது, ஆனால் எம்டியில் ஒரு முக்கியமான சிக்கல்: அகராதி-விழிப்புணர்வு மொழிபெயர்ப்பு. எங்கள் வேலையில்  LevT போன்ற தன்னியக்கமற்ற டிகோடிங் என்பது என்எம்டியில் ஒரு அதிநவீன ஆராய்ச்சிக்கான தலைப்பாகும். எங்கள் லெக்சிக்கல் கட்டுப்பாட்டு அணுகுமுறை  LevT கட்டமைப்பில் ஏற்படும் எதிர்கால முன்னேற்றத்திலிருந்து பயனடையும் என்று நாங்கள் நம்புகிறோம். ACL-2020 மாநாடு முழுவதும் நாங்கள் சந்தித்த முக்கியமான ஆராய்ச்சியாளர்களால் சுட்டிக்காட்டப்பட்டபடி, நாங்கள் ஆராய்வதற்கு நாங்கள் ஆர்வமாக இருக்கும் ஒரு திசை சொல் மறுசீரமைப்போடு தொடர்புடையதாகும். மற்றொரு சுவாரஸ்யமான திசையானது பல்வேறு கட்டுப்பாட்டுத் தேர்வு உத்திகளை ஆராய்வதாகும், இது கட்டுப்பாடுகளின் உருவ மாறுபாடுகளைக் கையாளக்கூடியதாகும்.

[Return to top](https://github.com/raymondhs/constrained-levt/blob/master/summary.md)


# सारांश (Hindi)

लोग अपनी मूल भाषाओं में संवाद करना चाहते हैं और मशीनी अनुवाद (Machine Translation) को हमारी अप्रत्यक्ष बातचीत के विभिन्न हिस्सों में सर्वव्यापी रूप से एकीकृत किया जा चुका है । Rakuten में, हम लोगों और व्यवसायों को वैश्विक स्तर पर उपयोगकर्ताओं (customers) तक, सामग्री का अनुवाद करके पहुँचने के लिए, बड़े पैमाने पर मशीन अनुवाद तकनीक का उपयोग करते हैं।

अक्सर योग्य परिणाम प्राप्त करने के लिए, मशीन अनुवाद को प्रचलित शब्दकोशों के साथ संवर्धित करने की आवश्यकता होती है। उदाहरण के लिए, चीनी वाक्यांश "紅米" (hóng mǐ)  का शाब्दिक अनुवाद लाल चावल है,  हालाँकि, 紅米 स्मार्टफ़ोन ब्रांड Redmi को भी सूचित कर सकता है। ई-कॉमर्स (E-Commerce) के संदर्भ में, कोई एमटी(MT) मॉडल को लाल चावल के बजाय "Mi Redmi" अनुवाद करने पे बाध्य करना चाह सकता है।

### शाब्दिक बाध्य लेवेन्शटीन ट्रांसफॉर्मर (Lexically Constrained LevT)

हमारे एसीएल 2020 के पेपर "लेवेन्शटीन ट्रांसफॉर्मर के साथ शाब्दिक बाध्य न्यूरल मशीन अनुवाद" में हम शब्दकोश-संवर्धित (उर्फ शाब्दिक बाध्य) न्यूरल-मशीन-अनुवाद (NMT) को बेहतर बनाने के हमारे प्रयास का वर्णन करते हैं। Gu इत्यादि (2019) ने  लेवेन्शटीन ट्रांसफॉर्मर (LevT) मॉडल पेश किया था जो लाक्षिक शब्दों को एकसमय उत्पन्न करता है और उसके बाद एक एक करके पुनरावृत्ति को हटाता या नए शब्द जोड़ता है। यह मॉडल लोकप्रिय ऑटो-रिग्रेसिव (auto-regressive) मॉडल के विपरीत है, जो की एक समय में एक अनुवादित शब्द उत्पन्न करता है।

हम शब्दकोश अनुवाद को लागू करने के लिए, शब्दकोश-शब्द अनुवादों को उत्पन्न होने से पहले सम्मिलित कर तथा मॉडल को इन शब्दकोश-शब्दों के इर्द गिर्द शब्दों को जोड़ या हटाकर अंतिम अनुवाद उत्पन्न करने का निर्णय लेने की छूट देकर LevT का विस्तार करते हैं।
हम इस कदम को बाधा प्रवेशन कदम द्वारा सम्बोधित करते हैं। इसके अलावा हम इन बाधा टोकनों के प्रवेशन व विलोपन को निषेधित कर सकते हैं ताकि वे अनुवाद आउटपुट में सही तरीक़े से प्रतीत हो सकें। क्यूँकि यह कदम केवल अनुमान के दौरान होता है, इसलिए हमारे मॉडल को नए विशिष्ट शब्दकोशों लिए फिर से प्रशिक्षित करने की आवश्यकता नहीं पड़ती है।

### उच्चतर शाब्दिक उपयोग, उच्चतर अनुवाद गुणवत्ता

मशीन ट्रांसलेशन वर्कशॉप (डब्लूएमटी) 2014 के अंग्रेज़ी से जर्मन ट्रांसलेशन मानदंड पर हमारे प्रयोग बताते हैं कि यह सरल तरीका अनुवाद गुणवत्ता (BLEU के आधार पर) या अनुवाद गति को नुकसान पहुंचाए बिना 100 प्रतिशत शब्द प्रयोग (term %) की गारंटी दे सकता है।
हम शाब्दिक बाध्य एनएमटी पर पिछले दृष्टिकोणों, जैसे Post & Vilar(2018) और Dinu इत्यादि (2019) द्वारा WMT'17 समाचार परीक्षण सेट के उपलब्ध कराए गए टिप्पणित संस्करण से तुलना भी करते हैं। हमारे तरीके के विपरीत, दोनों तरीके या तो शब्द प्रयोग की गारंटी देने में विफल रहतें हैं अथवा शब्द प्रयोग हेतु अनुवाद गति का त्याग करते हैं।

### आगामी कार्य
हमारे तरीके ने मशीन अनुवाद की एक बहुत ही विशिष्ट यधपि महत्वपूर्ण समस्या: 'शब्दकोश-जागरूक अनुवाद' को सफलतापूर्वक संबोधित किया है। नॉन-ऑटोरेग्रेसिव डिकोडिंग, जैसे हमारे कार्य में इस्तेमाल LevT, एनएमटी में एक अत्याधुनिक शोध का विषय है। हमारा मानना है कि भविष्य में LevT संरचना में आने वाले सुधार मात्र से शाब्दिक बाध्य तकनीक लाभान्वित होगी। मुख्य शोधकर्तायों द्वारा, जो कि  हमें ACL-2020 सम्मेलन में मिले थे, इंगित होने के कारण शब्द-क्रमान्तरण एक दिशा होगी जिसे हम भविष्य में जाँचने के लिए उत्साहित होंगे। एक और दिलचस्प दिशा विभिन्न बाधा चयन रणनीतियों की जाँच है, जो संभावित रूप से बाधाओं के रूपात्मक रूपों को संभाल सकती है।

[Return to top](https://github.com/raymondhs/constrained-levt/blob/master/summary.md)

# 摘要 (Chinese)

人们喜欢用自己的母语进行交流，机器翻译已广泛用于我们虚拟互动的各个角落。在乐天 (Rakuten)，我们的机器翻译技术应用广泛，人们和企业能够将内容翻译给全球用户。 

通常情况下，为达到理想的效果，机器翻译 (MT) 需要用自定义词典进行扩充。例如，汉语词组“红米”字面意思翻译为红米饭。但是，红米也可以指智能手机品牌，红米。在电子商务领域，可能需要对 MT 模式进行约束，将红米翻为 Redmi 而不是红米饭。

### 词汇约束的 Levenshtein 变压器

在我们的 ACL 2020论文中，“使用 Levenshtein 变压器进行词汇约束的神经机器翻译”中，我们描述了我们如何改进字典扩充（又叫做词汇约束）的NMT。Gu 等人 (2019) 引入了 Levenshtein 变压器 (LevT) 模型，该模型能同步生成目标单词，然后再迭代地删除或添加新单词。这与流行模式自回归 NMT 模型相反，这种模型能够逐个生成翻译的单词。


我们在翻译生成前插入词典术语翻译，并让模型决定在这些字典术语周围添加或删除单词以生成最终翻译，从而扩展 LevT 执行词典翻译。我们把这一步称之为约束插入步骤。我们可以进一步对这些约束标记进行禁止删除和插入操作，以确保它们在翻译输出中能够忠实显现。由于这一步骤仅仅是在推理阶段，我们的模型无需重新训练新的给定的自定义词典。

### 术语使用率越高，翻译质量越高 

我们在 2014 机器翻译研讨会 (WMT) 上进行的英语对德语翻译的实验表明，这种简单的方法可以保证 100% 的词典术语使用率，且不会损害翻译质量或速度。

我们还与以前的词汇约束 NMT 方法进行了比较，如 Post 和 Vila(2018)、Dinu 等人（2019 年）发布的 WMT'17 新闻领域测试集的注释版。与我们的方法不同，这两种方法要么不能确保术语使用，要么为强制使用术语极大地降低翻译速度。 

### 接下来我们要做什么？

我们的方法成功地解决了 MT 一个非常小众但又重要的问题：词典感知翻译。非自回归解码，如我们工作中的 LevT，是 NMT 的一个前沿研究课题。我们相信，将来 LevT 架构本身将受益于我们的词典约束法。单词重新排序是我们很乐意探索的一个方向，我们在 ACL-2020 会议期间所遇到的重要研究人员也指出过这一点。另一个有趣的方向是探索各种约束选择策略，这些策略有可能能够处理词汇约束的形态变异。

[Return to top](https://github.com/raymondhs/constrained-levt/blob/master/summary.md)

# 摘要 (Traditional Chinese - Hong Kong)

人們希望以自己的母語進行交流，機器翻譯已經無處不在地結合到我們虛擬互動的不同部分。在樂天，我們廣泛使用機器翻譯技術，讓人們和企業能夠翻譯內容以覆蓋全球用戶。

通常，機器翻譯 （MT）需要使用自定義詞典作補充，以獲得所需的結果。例如，中文短語「紅米」（hóngmǐ）的字面翻譯為紅米飯。但是，紅米也可以指代智能手機品牌Redmi。在電子商務領域，可能需要限制MT模型將紅米翻譯成Redmi，而不是紅米飯。

### 受語彙限制的 Levenshtein Transformer

在我們的ACL 2020論文《使用Levenshtein Transformer進行語彙限制的神經機器翻譯》中，描述了我們為改進詞典增強（又稱語彙限制）的NMT所做的努力。Gu等（2019）引入了Levenshtein Transformer（LevT）模型，該模型同時生成目標單詞，然後反復刪除或添加新單詞。這與採用自迴歸NMT模型（一次生成一個翻譯詞）的流行模式恰恰相反。

我們擴大LevT，以加強詞典翻譯。生成譯文之前，插入詞典術語翻譯並讓模型做出決策，是否在這些詞典詞彙周圍添加或刪除單詞以生成最終譯文。我們將此步驟稱為插入限制步驟。我們可以進一步禁止對這些限制標記的刪除和插入操作，以確保它們忠實地出現在翻譯輸出中。由於此步驟僅在推斷時發生，因此即使有新的自定義詞典，我們的模型也無需重新訓練。

### 術語使用率高，翻譯質素更高

我們在2014年機器翻譯研討會（WMT）英語到德語翻譯基準測試中的實驗表明，這種簡單的方法可以保證的詞典術語使用率（Term％）達到100％，而不會損害翻譯質素（就BLEU而言）或解碼速度。

我們還與受詞彙限制的NMT先前的方法比較，例如Post和Vilar（2018）及Dinu等人 （2019），在他們發布的帶註釋的WMT'17新聞測試集上。與我們的方法不同，這些方法要麼不能保證詞典中的術語使用，要麼大幅犧牲了翻譯速度來強制使用術語。

### 下一步是甚麼呢？

我們的方法已經成功解決了MT中的一個非常小眾但又很重要的問題：字典感知翻譯。非自回歸解碼，例如我們作品中的LevT，是NMT中最前沿的研究主題。我們相信，我們的詞彙限制方法將受益於LevT體系結構本身的未來改進。正如我們在ACL-2020會議期間會見的重要研究人員指出的那樣，我們很高興探索的一個方向是與單詞重排有關。另一個有趣的方向是探索各種限制選擇策略，這些策略可能可以處理限制的形態變異。

[Return to top](https://github.com/raymondhs/constrained-levt/blob/master/summary.md)

# 摘要 (Traditional Chinese - Taiwan)

人們希望以其母語溝通交流，而機器翻譯已經無處不在地整合到虛擬互動的不同部分。在樂天，我們廣泛使用機器翻譯技術，裨益個人與企業能夠翻譯其業務內容，進而觸及全球用戶。

通常，我們需要以自訂的詞典來強化機器翻譯（MT）方能得到所需的結果。例如，中文片語「紅米」（hóngmǐ）的字面翻譯為紅米飯。但是，紅米也可以指稱智慧型手機品牌 Redmi。在電子商務領域，我們可能需要限定 MT 模型將紅米譯為 Redmi，而不是紅米。

### 詞彙限定的 Levenshtein Transformer（萊文斯坦轉換程式）

在我們的 ACL 2020 論文《使用萊文斯坦轉換程式進行詞彙限定的神經機器翻譯》當中，說明了為改進詞典強化（又稱詞彙限定）的 NMT 所做的努力。Gu （2019）等人推出了萊文斯坦轉換程式（LevT）模型，該模型可同時生成目標單詞，然後迭代刪除或添加新單詞。這與採用自動回歸 NMT 模型（一次生成一個翻譯詞）的流行範例相反。

我們擴大 LevT 的功能來增強詞典翻譯品質，方法是在生成譯文之前插入詞典術語翻譯，並由模型做出決策，看是否要以這些詞典術語為主來添加或刪除單詞，以生成最終翻譯內容。我們將此步驟稱為限定插入步驟。我們可以進一步禁止對這些限定標記進行刪除和插入操作，以確保它們忠實地出現在譯文中。由於此步驟僅在推斷時發生，因此無需為已經有新自訂詞典的模型進行重新訓練。

### 術語使用率更高，翻譯品質更佳

我們在 2014 年的機器翻譯研討會（WMT）英語翻德語基準測試中的實驗顯示，這種簡單的方法可以保證 100％ 的詞典術語使用率（Term％），而不會損害到翻譯品質（就 BLEU 而言）或原文的解讀速度。

我們還比較了詞彙限定 NMT 的先前方法，例如 Post and Vilar（2018）和 Dinu 等人（2019）發布的附註版 WMT'17 新聞測試集。與我們的方法不同的是，這些方法不但無法保證詞典術語的使用，實際上還為了強制使用術語而犧牲掉翻譯速度。

### 接下來怎麼辦呢？

我們的方法已經成功解決了機器翻譯的一個利基型重要問題，那就是詞典感知式翻譯。非自我迴歸解構，諸如我們工作中的 LevT，是 NMT 中最新銳的研究主題。我們相信，詞彙限定方法終將因 LevT 體系結構本身未來的改進而受益良多。我們迫不及待想探究的一個方向與單詞重排有關，正如我們在 ACL-2020 會議期間遇見的重要研究人員所指出的那樣。另一個有趣的方向是探究各種限定選擇策略，這些策略可能可以處理各種限定的形態變化。

[Return to top](https://github.com/raymondhs/constrained-levt/blob/master/summary.md)

# 요약 (Korean)

사람들은 모국어로 의사소통하기를 원하며 기계 번역은 가상 현실의 여러 부분에서 어디에나 존재하도록 통합되었습니다. 라쿠텐에서는 전 세계의 사용자에게 도달할 콘텐츠를 번역하는 사람과 기업에 힘을 실어줄 번역 기술을 널리 사용합니다.

가끔 원하는 결과를 얻기 위해 기계 번역 (MT) 을 사용자 정의 사전으로 보완할 필요가 있습니다. 예를 들어, 중국어 문구인 "紅 米"(hóng mǐ)는 문자 그대로 빨간 쌀로 번역합니다. 그러나 紅 米는 스마트 폰 브랜드인 레드미를 가리킬 수도 있습니다. 전자 상거래 도메인의 경우, 紅米를 빨간 쌀 대신 레드미로 번역하려면 기계 번역 모델을 제한 할 수도 있습니다.

### 사전적으로 제한된 레벤슈타인 트랜스포머

ACL 2020 논문인 "레벤슈타인 트랜스포머로 사전적으로 제한된 인공 신경망 번역"에서, 사전 증강 (일명 사전적 제한) 인공 신경망 번역을 개선하기 위해 우리가 어떤 노력을 했는지 설명합니다. 구 외 나머지 (2019)는 대상 단어를 동시에 생성한 후 반복하여 새로운 단어를 삭제하거나 추가하는 레벤슈타인 트랜스포머 (LevT) 모델을 도입했습니다. 이는 한 번에 하나씩 번역된 단어를 생성하는 자동 회귀 인공 신경망 번역 모델을 사용하는 일반적인 패러다임과 반대됩니다.

생성 이전에 사전 용어 번역을 삽입하고 최종 번역을 생성하기 위해 모델이 이러한 사전 용어를 따른 단어를 추가하거나 삭제하도록 결정하게 하여 사전 용어를 강화하기 위해 레벤슈타인 트랜스포머를 확장합니다. 이 단계를 구속 조건 삽입 단계라고합니다. 변환 출력을 정확하게 표시하도록 이러한 제한 조건 토큰에 대한 삭제 및 삽입 조작을 추가로 금지할 수 있습니다. 이 단계는 추론에서만 발생하기 때문에 새로운 사용자 정의 사전을 고려하여 모델을 다시 학습할 필요가 없습니다.

### 더 높은 용어 사용률, 더 나은 번역 품질

워크숍에서의 기계 번역 (WMT) 2014 영어-독일 번역 벤치마크 에 대한 실험에서는 이 간단한 접근 방식이 번역 품질 (BLEU 측면) 또는 디코딩 속도에 영향을 주지 않으면서 100% 사전 용어 사용 (Term %)을 보장할 수 있음을 보여줍니다.

또한, 우리는 WMA' 17 뉴스 테스트 세트의 발표된 주석 본에서 Post and Viler (2018) 및 데누 외 나머지 (2019)와 같은 사전적으로 제한된 인공 신경망 번역에 대한 이전의 접근법을 비교했습니다. 우리의 접근 방식과 다르게, 접근 방식은 사전 용어 사용을 보장하지 못하거나 강제로 용어를 사용하게 하여 번역 속도를 크게 느리게 만들었습니다.

### 다음은 뭘까요?

우리의 접근 방식은 기계 번역에서 중요한 문제인 사전 인식 번역을 성공적으로 해결했습니다. 우리의 레벤슈타인 트랜스포머와 같은 비 자동회귀 디코딩은 인공 신경망 번역의 최첨단 연구 주제입니다. 우리는 어휘 제약 접근 방식이 향후 레벤슈타인 트랜스포머 구성 자체의 개선에 도움이 될 것이라고 믿습니다. ACL-2020회의에서 우리가 만난 중요한 연구자들이 지적한 바와 같이, 우리가 탐구할 방향은 단어 재정리와 관련이 있습니다. 또 다른 흥미로운 방향은 다양한 제한 조건 선택 전략을 탐색하는 것인데, 이는 잠재적으로 구속 조건의 형태적 변형을 처리할 수 있습니다.

[Return to top](https://github.com/raymondhs/constrained-levt/blob/master/summary.md)

# Tóm lược (Vietnamese)

Mọi người muốn giao tiếp bằng tiếng mẹ đẻ và dịch máy đã được tích hợp rộng khắp vào các khía cạnh tương tác ảo khác nhau của chúng ta. Tại Rakuten, chúng tôi sử dụng công nghệ dịch máy một cách rộng rãi để giúp mọi người và doanh nghiệp có khả năng dịch nội dung để tiếp cận người dùng trên toàn cầu.

Thông thường, dịch máy (MT) cần được tăng cường với từ điển tùy chỉnh để có được kết quả mong muốn. Ví dụ: cụm từ tiếng Trung "紅米" (hồng mễ) dịch theo nghĩa đen là gạo lứt. Tuy nhiên, 紅米 cũng có thể đề cập đến thương hiệu điện thoại thông minh Redmi. Trong trường hợp này của lĩnh vực thương mại điện tử, người ta có thể muốn ràng buộc mô hình MT để dịch 紅米 là Redmi chứ không phải là gạo lứt.

### Phép biến đổi Levenshtein bị ràng buộc về từ vựng

Trong bài báo ACL 2020 của mình, "Dịch máy bằng nơ-ron với Phép biến đổi Levenshtein bị ràng buộc về từ vựng", chúng tôi mô tả nỗ lực để cải thiện NMT được tăng cường từ điển (còn gọi là bị ràng buộc về từ vựng) của mình. Gu cùng các cộng sự (2019) đã giới thiệu mô hình Phép biến đổi Levenshtein (LevT) vốn tạo ra các từ đích một cách đồng thời và sau đó lặp đi lặp lại quá trình xóa hoặc thêm từ mới. Mô hình này trái ngược với mô thức phổ biến về việc sử dụng các mô hình NMT tự hồi quy vốn tạo ra từng từ được dịch một.

Chúng tôi mở rộng LevT để thực hiện các bản dịch từ điển bằng cách chèn các bản dịch thuật ngữ từ điển trước khi tạo và cho mô hình đưa ra quyết định thêm hoặc xóa các từ xoay quanh các thuật ngữ từ điển này để tạo bản dịch cuối cùng. Chúng tôi gọi bước này là bước chèn ràng buộc. Ngoài ra, chúng tôi có thể không cho phép các thao tác xóa và chèn đối với các token ràng buộc này để đảm bảo rằng chúng xuất hiện chính xác trong bản dịch đầu ra. Vì bước này chỉ diễn ra khi suy luận, mô hình của chúng tôi không cần phải được đào tạo lại với các từ điển tùy chỉnh mới.

### Sử dụng nhiều thuật ngữ hơn, chất lượng dịch cao hơn

Các thử nghiệm của chúng tôi tại Hội thảo về Dịch Máy (WMT) năm 2014 bản dịch tiếng Anh sang tiếng Đức cho thấy phương pháp đơn giản này có thể đảm bảo việc sử dụng 100% thuật ngữ từ điển mà không làm giảm chất lượng hoặc tốc độ dịch.

Chúng tôi cũng so sánh với các phương pháp trước đây về NMT bị ràng buộc về từ vựng, chẳng hạn như Post và Vilar (2018) và Dinu cùng các cộng sự (2019), trên phiên bản có chú thích của bộ thử nghiệm tin tức WMT'17 mà họ đã phát hành. Không giống như phương pháp của chúng tôi, cả hai phương pháp đó đều không đảm bảo việc sử dụng thuật ngữ hoặc đã hy sinh đáng kể tốc độ dịch để thực hiện việc sử dụng thuật ngữ.

### Tiếp theo là gì?

Phương pháp của chúng tôi đã giải quyết thành công một vấn đề rất đặc thù nhưng quan trọng trong MT: dịch thuật chú ý đến từ điển. Giải mã không tự hồi quy, chẳng hạn như LevT trong công trình của chúng tôi, là một chủ đề nghiên cứu tiên tiến trong NMT. Chúng tôi tin rằng phương pháp ràng buộc từ vựng của mình sẽ được hưởng lợi từ những cải tiến sau này trong chính kiến trúc LevT. Một hướng đi mà chúng tôi rất muốn nghiên cứu có liên quan đến việc sắp xếp lại từ, như đã được chỉ ra bởi các nhà nghiên cứu phê phán mà chúng tôi đã gặp trong suốt hội nghị ACL-2020. Một hướng đi thú vị khác là nghiên cứu các chiến lược lựa chọn ràng buộc khác nhau, vốn có khả năng xử lý các biến thể hình thái của các ràng buộc.

[Return to top](https://github.com/raymondhs/constrained-levt/blob/master/summary.md)

