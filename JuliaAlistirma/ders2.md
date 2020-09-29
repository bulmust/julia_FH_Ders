<!-- TOC -->

- [Julia ile Diferansiyel Denklem Çözmek](#julia-ile-diferansiyel-denklem-çözmek)
    - [Julia Diferansiyel Denklemler Çözme Paketinin Yüklenmesi](#julia-diferansiyel-denklemler-çözme-paketinin-yüklenmesi)
    - [Basit Bir Diferansiyel Denklem Çözme](#basit-bir-diferansiyel-denklem-çözme)

<!-- /TOC -->

# Julia ile Diferansiyel Denklem Çözmek

## Julia Diferansiyel Denklemler Çözme Paketinin Yüklenmesi

- Wiki Sayfası: [hhttps://diffeq.sciml.ai/release-2.1/](https://diffeq.sciml.ai/release-2.1/)

- Bilimsel Makina öğrenimi açılmış simülasyon ve tahminle diferansiyel denklem çözümü: [https://diffeq.sciml.ai/stable/](https://diffeq.sciml.ai/stable/)

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

## Basit Bir Diferansiyel Denklem Çözme

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
