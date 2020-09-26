# Julia Programla Dili İle ODE Çözümü
<!-- TOC -->

- [Julia Programla Dili İle ODE Çözümü](#julia-programla-dili-i̇le-ode-çözümü)
    - [Julia'yı Yükleme](#juliayı-yükleme)
    - [Yüklemek İçin İndirilmesi Gereken Dosya](#yüklemek-i̇çin-i̇ndirilmesi-gereken-dosya)
    - [Alıştırmalar](#alıştırmalar)
        - [Hello World](#hello-world)
        - [Ekrana Tek Sayıları Yazdırma](#ekrana-tek-sayıları-yazdırma)
        - [Kullanıcının Verdiği Yarıçap İle Kürenin Hacmini Hesaplayan Fonksiyon Yazma](#kullanıcının-verdiği-yarıçap-i̇le-kürenin-hacmini-hesaplayan-fonksiyon-yazma)
        - [Julia'da Class Yazma](#juliada-class-yazma)
    - [Julia ile Diferansiyel Denklem Çözmek](#julia-ile-diferansiyel-denklem-çözmek)
        - [Julia Diferansiyel Denklemler Çözme Paketinin Yüklenmesi](#julia-diferansiyel-denklemler-çözme-paketinin-yüklenmesi)
        - [Basit Bir Diferansiyel Denklem Çözme](#basit-bir-diferansiyel-denklem-çözme)

<!-- /TOC -->

## Julia'yı Yükleme

Github Linki: [https://github.com/JuliaLang/julia](https://github.com/JuliaLang/julia)

Yükleme Linki: [https://julialang.org/downloads/](https://julialang.org/downloads/)

## Yüklemek İçin İndirilmesi Gereken Dosya

Windows: 64-bit (installer) ~ 65 MB

Linux:

- Ubuntu (Eski Surum):
`sudo apt install julia`
  
- Ubuntu (En Yeni Sürüm, 1.5.1, 10.09.2020)

```bash
 wget https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.1-linux-x86_64.tar.gz
 tar -xvf julia-1.5.1-linux-x86_64.tar.gz
 sudo mv -r julia-1.5.1/ /opt/
 ln -s /opt/julia-1.5.1/bin/julia/ /usr/local/bin/
```

- Arch Linux:

```bash
sudo pacman -S base-devel git
git clone https://aur.archlinux.org/julia-bin.git
cd julia-bin
makepkg -si
```

## Alıştırmalar

- Yeni bir klasör oluşturun. `cd; mkdir JuliaAlistirma; cd JuliaAlistirma`

### Hello World

- "helloWorld.jl" adlı bir dosya oluştur ve içerisine `println("Hello World")` yaz. Kaydet ve çıkın.
- Terminale `julia helloWorld.jl` yazıp çalıştırın.

### Ekrana Tek Sayıları Yazdırma

- tekSayiYazdir.jl dosyasını oluşturun.
`touch tekSayiYazdir.jl`

- Aşağıdaki kodu tekSayiYazdir.jl dosyasının içine yazın.

```julia
for i = 1:10
  if isodd(i)
    println(i)
  end
end
```

- Terminalde `julia tekSayiYazdir.jl` kodunu çalıştırın.

### Kullanıcının Verdiği Yarıçap İle Kürenin Hacmini Hesaplayan Fonksiyon Yazma

- kureHacmiBul.jl dosyasını oluşturun.
`touch kureHacmiBul.jl`

- Aşağıdaki kodu kureHacmiBul.jl dosyasının içine yazın.

```julia
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

- Terminalde `julia kureHacmiBul.jl` kodunu çalıştırın.

### Julia'da Class Yazma

- denemeModul.jl dosyasını oluşturun.
`touch denemeModul.jl`

- denemeModul.jl dosyasına aşağıdaki kodu yazın.

```julia
module denemeModul
function deneme_modulu(x)
    println("Bu deneme moduludur.")
    return x
end

end
```

- Deneme modülünü çalıştıracak `denemeModulCalistir.jl` dosyasını oluşturun.
`touch denemeModulCalistir.jl`

- denemeModulCalistir.jl dosyasına aşağıdaki kodu yazın.

```julia
# Hamiltonyenler modulunu cagir.
include("./denemeModul.jl")

denemeModul.deneme_modulu(1)
```

- Terminalde `julia denemeModulCalistir.jl` kodunu çalıştırın.

-----------------

## Julia ile Diferansiyel Denklem Çözmek

### Julia Diferansiyel Denklemler Çözme Paketinin Yüklenmesi

- Julia'yı terminalde açın.

`julia`

- Aşağıdaki komutu yazarak Julia Differansiyel denklemler paketini indirin.

`import Pkg; Pkg.add("DifferentialEquations")`

- Diferansiyel denklem paketini derleyin. Bu işlem biraz süre alacaktır.

`@time using DifferentialEquations`

```julia
[ Info: Precompiling DifferentialEquations [0c46a032-eb83-5123-abaf-570d42b7fbaa]
467.598932 seconds (60.34 M allocations: 3.335 GiB, 0.33% gc time)
```

**Not:** `sudo apt install julia` komutu ile julia yüklendiğinde sorun yaşanabilir.

- Diferansiyel denklem modulunu başarı ile yüklediniz. 

- Diferansiyel denklemlerin çözümlerini çizdirmek gerekmektedir. Bunun için Julia'nın Plots paketini de yükleyin.

`import Pkg; Pkg.add("Plots")`

- Plots paketini derleyin. Bu işlem biraz süre alacaktır.

 `@time using Plots`.

```julia
[ Info: Precompiling Plots [91a5bcdd-55d7-5caf-9e0b-520d859cae80]
137.828417 seconds (12.93 M allocations: 760.269 MiB, 0.25% gc time)
```

### Basit Bir Diferansiyel Denklem Çözme

- $\frac{du}{dt}' = u$ diferansiyel denklemini çözen bir program yazın. Bu denklemi çözecek olan basitDifDenkCoz.jl dosyası oluşturun.

`touch basitDifDenkCoz.jl`

- basitDifDenkCoz.jl dosyasyının içine aşağıdaki kodu yazın.

```julia
# Differansiyel Denklem Modulunu Cagir
println("Difernasiyel Denklem Cozum Modulunun Yuklenmesi:")
@time using DifferentialEquations
println("===========")
# Cizim modulunu cagirin.
println("Plots Modulunun Yuklenmesi:")
@time using Plots
println("===========")

function difdenkcoz()

	# Denklemin sag tarafini belirle
	f2(u,p,t) = u;

	# U'nun baslangic degerini belirleyin. (Baslangic Deger Problemi)
	u0 = 1/2;

	# t'nin hangi araligina kadar cozeceginizi belirleyin.
	tspan = (0.0, 1.0);

	# Problemi olusturun.
	prob2 = ODEProblem(f2, u0, tspan);

	# Problemi Cozun
	println("Difernasiyel Denklem Cozum Suresi:")
	@time sol = solve(prob2, Tsit5(), reltol=1e-8, abstol=1e-8);
	println("===========")

	# --------------------------
	# Cozumu cizdirmek icin

	# Cozdugunuz denklemi cizdirin
	figure1 = plot(sol, linewidth=5, title="Basit Difernasiyel Denklem Cozumu",
		xaxis="Time (t)", yaxis="u(t) (in μm)", label="Sayisal Cozum")

	# Teorik Cozumu de cizdirin
	figure1 = plot!(sol.t, t->0.5*exp(t), lw=3, ls=:dash, label="Teorik Cozum")

	# Grafigi Kaydedin
	png(figure1, "basitDifDenkCoz")
end


difdenkcoz()
```

- Ardından terminalde şu kodu çalıştırın.

`julia basitDifDenkCoz.jl`

```bash
Difernasiyel Denklem Cozum Modulunun Yuklenmesi:
 29.422458 seconds (60.18 M allocations: 3.331 GiB, 5.35% gc time)
===========
Plots Modulunun Yuklenmesi:
 13.589629 seconds (12.43 M allocations: 738.577 MiB, 1.93% gc time)
===========
Difernasiyel Denklem Cozum Suresi:
  2.563351 seconds (4.24 M allocations: 219.951 MiB, 4.56% gc time)
===========
qt5ct: using qt5ct plugin
```

- Yukarıda görüldüğü gibi script'te modüllerin yüklenmesi epeyce uzun bir süre almaktadır.
