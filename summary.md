Summary
==== 

This is an extended summary of the ["Lexically Constrained Neural Machine Translation with Levenshtein Transformer"](https://www.aclweb.org/anthology/2020.acl-main.325/) paper published in ACL 2020. We have provided multilingual summaries for our work as follows:

**Langauges**

 - English
 - Japanse
 - Indonesian
 - 


# Summary (English)

People want to communicate in their native languages and machine translation has been ubiquitously integrated to different parts of our virtual interactions. At Rakuten, we use machine translation technology extensively to empower people and businesses to translate content to reach users globally. 

Often, machine translation (MT) needs to be augmented with custom dictionaries to get the desired results. For example, the Chinese phrase "紅米" (hóng mǐ) literally translates to red rice. However, 紅米 can also refer to the smartphone brand, Redmi. In the case of e-commerce domain, one may want to constrain the MT model to translate 紅米 as Redmi instead of red rice.

### Lexically constrained Levenshtein Transformer

In our ACL 2020 paper, "Lexically constrained neural machine translation with Levenshtein Transformer", we describe our effort to improve dictionary-augmented (aka. lexically constrained) NMT. Gu et al. (2019) introduced the Levenshtein Transformer (LevT) model that generates the target words simultaneously and thereafter iteratively delete or add new words. This is opposed to the popular paradigm of employing auto-regressive NMT models that generate translated words one at a time.

We extend LevT to enforce the dictionary translations by inserting the dictionary term translations before the generation and letting the model make decisions to add or delete words around these dictionary terms to generate the final translation. We refer to this step as the constraint insertion step. We can further disallow deletion and insertion operations on these constraint tokens to make sure that they faithfully appear in the translation output. Since this step happens only at inference, our model doesn't need to be re-trained given new custom dictionaries.

### Higher term usage, higher translation quality 

Our experiments on Workshop on Machine Translation (WMT) 2014 English to German translation benchmark show that this simple approach can guarantee 100% dictionary term usage (Term%) without harming the translation quality (in terms of BLEU) or decoding speed.

We also compare with previous approaches on lexically constrained NMT, such as Post and Vilar (2018) and Dinu et al. (2019), on their released annotated version of the WMT'17 news test set. Unlike our approach,  approaches either failed to guarantee the dictionary term usage or have sacrificed translation speed substantially to enforce the term usage. 

### What's next?

Our approach has successfully addressed a very niche, yet an important problem in MT: dictionary-aware translation. Non-autoregressive decoding, such as LevT in our work, is one cutting-edge research topic in NMT. We believe that our lexical constraint approach will benefit from future improvement in the LevT architecture itself. One direction we would be excited to explore is related to word reordering, as it has been pointed by critical researchers we met throughout the ACL-2020 conference. Another interesting direction is to explore various constraint selection strategies, which potentially can handle morphological variants of the constraints.

### References

Matt Post and David Vilar. 2018. Fast Lexically Constrained Decoding with Dynamic Beam Allocation for Neural Machine Translation. In Proceedings of the 2018 Conference of the North American Chapter of the Association for Computational Linguistics: Human Language Technologies, Volume 1 (Long Papers).

Georgiana Dinu, Prashant Mathur, Marcello Federico, Yaser Al-Onaizan. 2019. Training Neural Machine Translation to Apply Terminology Constraints. In Proceedings of the 57th Annual Meeting of the Association for Computational Linguistics.

Jiatao Gu, Changhan Wang, and Junbo Zhao. 2019. Levenshtein transformer. In Advances in Neural Information Processing Systems 32.


[Return to top]()

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

[Return to top]()

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

[Return to top]()
