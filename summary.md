Summary
==== 

This is an extended summary of the ["Lexically Constrained Neural Machine Translation with Levenshtein Transformer"](https://www.aclweb.org/anthology/2020.acl-main.325/) paper published in ACL 2020. We have provided multilingual summaries for our work as follows:

**Languages**

 - [Summary (English)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#summary-english)
 - [概要 (Japanese)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#%E6%A6%82%E8%A6%81-japanese)
 - [Ringkasan (Indonesian)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#ringkasan-indonesian)
 - [சுருக்கம் (Tamil)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#%E0%AE%9A%E0%AF%81%E0%AE%B0%E0%AF%81%E0%AE%95%E0%AF%8D%E0%AE%95%E0%AE%AE%E0%AF%8D-tamil)
 - [摘要 (Chinese)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#%E6%91%98%E8%A6%81-chinese)
 - [सारांश (Hindi)](https://github.com/raymondhs/constrained-levt/blob/master/summary.md#%E0%A4%B8%E0%A4%BE%E0%A4%B0%E0%A4%BE%E0%A4%82%E0%A4%B6-hindi)
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

# सारांश (Hindi)


लोग अपनी मूल भाषाओं में संवाद करना चाहते हैं और मशीनी अनुवाद को हमारी आभासी बातचीत के विभिन्न हिस्सों में सर्वव्यापी रूप से एकीकृत किया गया है। Rakuten में, हम लोगों और व्यवसायों को वैश्विक स्तर पर उपयोगकर्ताओं तक पहुँचाने के लिए सामग्री का अनुवाद करने के लिए बड़े पैमाने पर मशीन अनुवाद तकनीक का उपयोग करते हैं।

वांछित परिणाम प्राप्त करने के लिए अक्सर, मशीन अनुवाद (MT) को प्रचलित शब्दकोशों के साथ संवर्धित करने की आवश्यकता होती है। उदाहरण के लिए, चीनी वाक्यांश "紅米" (hóng mǐ)  का शाब्दिक अनुवाद लाल चावल से है। हालाँकि, 紅米 brand, स्मार्टफ़ोन ब्रांड, Redmi से संबद्ध कर सकता है। ई-कॉमर्स डोमेन के मामले में, कोई एमटी मॉडल को लाल चावल के बजाय mi Redmi के रूप में अनुवाद करने के लिए बाध्य कर सकता है।

### शाब्दिक बंध लेवेन्शटीन ट्रांसफॉर्मर

हमारे एसीएल 2020 के पेपर में, "लेवेन्शटीन ट्रांसफॉर्मर के साथ शाब्दिक बंध न्यूरल मशीन अनुवाद", हम शब्दकोश-संवर्धित (उर्फ। lexically विवश) NMT को बेहतर बनाने के हमारे प्रयास का वर्णन करते हैं। जी यू इत्यादि  । (2019) ने  लेवेन्शटीन ट्रांसफॉर्मर (LevT) मॉडल पेश किया जो लक्ष्य शब्दों को एक साथ उत्पन्न करता है और उसके बाद पुनरावृत्ति को हटाता है या नए शब्द जोड़ता है। यह ऑटो-रिग्रेसिव एन एम टी मॉडल को रोजगार देने के लोकप्रिय प्रतिमान के विरोध में है जो एक समय में एक अनुवादित शब्द उत्पन्न करता है।


हम पीढ़ी के समक्ष शब्दकोश शब्द अनुवादों को सम्मिलित करके शब्दकोश अनुवाद को लागू करने के लिए LevT का विस्तार करते हैं और मॉडल को अंतिम अनुवाद बनाने के लिए इन शब्दकोश शब्दों के समीप शब्दों को जोड़ने या हटाने का निर्णय लेने देते हैं। हम इस कदम को बाधा प्रविष्टि कदम के रूप में संदर्भित करते हैं। हम यह सुनिश्चित करने के लिए इन अवरोध टोकनों पर विलोपन और सम्मिलन संचालन को आगे बढ़ा सकते हैं कि वे अनुवाद आउटपुट में ईमानदारी से दिखाई दें। चूंकि यह कदम केवल अनुमान के आधार पर  होता है, इसलिए हमारे मॉडल को नए प्रचलित शब्दकोशों को फिर से प्रशिक्षित करने की आवश्यकता नहीं है।

### उच्चतर शब्द उपयोग, उच्चतर अनुवाद गुणवत्ता

हमारी  मशीन ट्रांसलेशन पर वर्कशॉप (डब्लूएमटी) 2014 इंग्लिश टू जर्मन ट्रांसलेशन पर हमारे प्रयोग बताते हैं कि यह सरल दृष्टिकोण अनुवाद की गुणवत्ता या गति को नुकसान पहुंचाए बिना 100% शब्द प्रयोग की गारंटी दे सकता है।

हम लेक्सिक रूप से विवश एनएमटी पर पिछले दृष्टिकोणों की तुलना भी करते हैं, जैसे पोस्ट और विलार (2018) और दीनू इत्यादि  । (2019), WMT'17 समाचार परीक्षण सेट के उनके जारी किए गए एनोटेट संस्करण पर। हमारे दृष्टिकोण के विपरीत, दोनों दृष्टिकोण शब्द के उपयोग की गारंटी देने में विफल रहे हैं या शब्द के उपयोग को लागू करने के लिए अनुवाद की गति को पर्याप्त रूप से त्याग दिया है।

### आगे क्या होगा?

हमारे दृष्टिकोण ने सफलतापूर्वक एक बहुत ही आला को संबोधित किया है, फिर भी एमटी में एक महत्वपूर्ण समस्या है: शब्दकोश-जागरूक अनुवाद। हमारे काम में नॉन ऑटोरेग्रेसिव डिकोडिंग जैसेLevT, एनएमटी में एक अत्याधुनिक शोध विषय है। हमारा मानना है कि लेक्सिक वास्तुकला में भविष्य के सुधार से हमारे शाब्दिक बाधा दृष्टिकोण को लाभ होगा। एक दिशा जिसे हम तलाशने के लिए उत्साहित होंगे, शब्द रिऑर्डरिंग से संबंधित है, क्योंकि यह महत्वपूर्ण शोधकर्ताओं द्वारा इंगित किया गया है जो हमे पूरे ACL-2020 सम्मेलन में मिले थे। एक और दिलचस्प दिशा विभिन्न बाधा चयन रणनीतियों का पता लगाने के लिए है, जो संभावित रूप से बाधाओं के रूपात्मक रूपों को संभाल सकती है।

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

