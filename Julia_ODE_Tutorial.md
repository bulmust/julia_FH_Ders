## Julia'yı Yükleme
Github Linki: [https://github.com/JuliaLang/julia](https://github.com/JuliaLang/julia)

Yükleme Linki: [https://julialang.org/downloads/](https://julialang.org/downloads/)

### Yüklemek İçin İndirilmesi Gereken Dosya
Windows: 64-bit (installer) ~ 65 MB

Linux:

  - Ubuntu (Eski Surum): 
  ´sudo apt install julia´ 
  
  - Ubuntu (En Yeni Sürüm, 1.5.1, 10.09.2020)
  ´wget https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.1-linux-x86_64.tar.gz´
  ´tar -xvf julia-1.5.1-linux-x86_64.tar.gz´
  ´sudo mv -r julia-1.5.1/ /opt/´
  ´ln -s /opt/julia-1.5.1/bin/julia/ /usr/local/bin/´

  - Arch Linux:
  ´´´
  sudo pacman -S base-devel git
  git clone https://aur.archlinux.org/julia-bin.git
  cd julia-bin
  makepkg -si
  ´´´

## Alıştırmalar
- Yeni bir klasör oluşturun.
´cd; mkdir JuliaAlistirma; cd JuliaAlistirma´

### Hello World

- "helloWorld.jl" adlı bir dosya oluştur ve içerisine ´println("Hello World")´ yaz. Kaydet ve çık.
- Terminale ´julia helloWorld.jl´ yazıp çalıştırın.

### Ekrana Tek Sayıları Yazdırma

- tekSayiYazdir.jl dosyasını oluşturun.
´touch tekSayiYazdir.jl´

- Aşağıdaki kodu tekSayiYazdir.jl dosyasının içine yazın.
´´´
for i = 1:10
  if isodd(i)
    println(i)
  end
end
´´´

- Terminalde ´julia tekSayiYazdir.jl´ kodunu çalıştırın.

### Kullanıcının Verdiği Yarıçap İle Kürenin Hacmini Hesaplayan Fonksiyon Yazma

- kureHacmiBul.jl dosyasını oluşturun.
´touch kureHacmiBul.jl´

- Aşağıdaki kodu kureHacmiBul.jl dosyasının içine yazın.
```
function kure_hacmi_hesapla(r)
    # Julia'da Yorum Boyle Yazilir
    return 4/3*pi*r^3
end

# Kullanicidan Sayi Isteme Notunu Yazdirin
println("Lutfen Kurenin Yaricapini Girip Entera Basiniz")

# Kullanicin yazdigini okutun
r = readline()

# Kullanicinin Yazdigini integer (tam sayiya) cevirin
r = parse(Int64, r)

println("Kurenin Hacmi: ", kure_hacmi_hesapla(r))
```
- Terminalde ´julia kureHacmiBul.jl´ kodunu çalıştırın.

### Julia'da Class Yazma

- denemeModul.jl dosyasını oluşturun.
´touch denemeModul.jl´

- denemeModul.jl dosyasına aşağıdaki kodu yazın.
´´´
module denemeModul
function deneme_modulu(x)
    println("Bu deneme moduludur.")
    return x
end

end

´´´

- Deneme modülünü çalıştıracak ´denemeModulCalistir.jl´ dosyasını oluşturun.
´touch denemeModulCalistir.jl´

- denemeModulCalistir.jl dosyasına aşağıdaki kodu yazın.
´´´
# Hamiltonyenler modulunu cagir.
include("./denemeModul.jl")

denemeModul.deneme_modulu(1)
´´´

- Terminalde ´julia denemeModulCalistir.jl´ kodunu çalıştırın.


## Julia ile Diferansiyel Denklem Çözmek

### Julia Diferansiyel Denklemler Çözme Paketinin Yüklenmesi

- Julia'yı terminalde açın.
´julia´

- Aşağıdaki komutu yazın.
´import Pkg; Pkg.add("DifferentialEquations")´

Not: ´sudo apt install julia´ komutu ile yüklendiğinde sorun yaşanabilir.

- Diferansiyel denklem modulunu başarı ile yüklediniz.

### Basit Bir Diferansiyel Denklem Çözme
- $\frac{du}{dt}' = t$ diferansiyel denklemini çözelim. Bu denklemi çözecek basitDifDenkCoz.jl dosyası oluşturun.
´touch basitDifDenkCoz.jl´

- basitDifDenkCoz.jl dosyasyının içine aşağıdaki kodu yazın.
























