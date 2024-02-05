## Platforma Özgü kod Nedir ? Hangi Durumlarda İhtiyaç duyarız?

Platforma özgü kod yazma, bir uygulamanın farklı işletim sistemlerinde çalışabilmesi için her platformun gereksinimlerine uygun kod yazmayı ifade eder.

Platforma özgü kod yazma ihtiyacı, farklı işletim sistemlerinin ve platformların sunduğu özelliklere ve API'lere erişme gereksiniminden kaynaklanır. Örneğin, Android ve iOS'un farklı kamera API'leri veya sistem düzeyindeki özel özelliklere erişim için platforma özgü kod yazmak gerekebilir. Böylece uygulama, her platformda en iyi performansı ve kullanıcı deneyimini elde edebilir.

## Platforma özel kod yazma da kullanılan yöntemler nelerdir?

Flutter, geliştiricilere üç tür platform kanalı sunar:

1. **MethodChannel (Yöntem Kanalı):** Yerel platformdaki bir yöntemi çağırmak ve sonuçları almak için kullanılır. Bu, Dart kodunun doğrudan yerel platformun API'lerini kullanabilmesini sağlar.
2. **EventChannel (Etkinlik Kanalı):** Yerel platformdan Flutter'a doğru olay akışını destekler. Örneğin, sensör verilerini veya diğer sürekli güncellemeleri iletmek için kullanılabilir.
3. **BasicMessageChannel (Temel Mesaj Kanalı):** Temel JSON benzeri değerlerin etkileşimini destekler. Bu kanal, daha karmaşık veri yapılarını ve özel iletişim senaryolarını işlemek için kullanışlıdır.

Method Channel Avantajları
- Flutter'da bulunmayan yerel işlevlere erişmenizi sağlarlar.
- Flutter ve yerel kod arasında iletişim kurmanın bir yolunu sağlarlar, bu da veri paylaşmak veya olay göndermek gibi şeyler için yararlı olabilir.
- Kullanımı nispeten kolaydır ve çeşitli şekillerde uygulanabilirler.


### Ekran Görüntüleri
<table>
  <tr>
      <td>Ornek Kullanım</td>
     <td>Ornek Kullanım</td>

  <tr>
     <td><img src="https://github.com/Hilalbiyik/platform_spesific_code_case/assets/77548014/86840cc9-deb1-4d09-94d7-ea9b98a6c72e.png"width="200" ></td>
        <td><img src="https://github.com/Hilalbiyik/platform_spesific_code_case/assets/77548014/8ae4656b-0f6a-4740-9986-f2e76d34c8b5.png"width="200" ></td> 

 </table>
