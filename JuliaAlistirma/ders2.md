<!-- TOC -->

- [Julia ile Diferansiyel Denklem Çözmek](#julia-ile-diferansiyel-denklem-çözmek)
    - [Julia Diferansiyel Denklemler Çözme Paketinin Yüklenmesi](#julia-diferansiyel-denklemler-çözme-paketinin-yüklenmesi)
    - [Basit Bir Adi Diferansiyel Denklem Çözme](#basit-bir-adi-diferansiyel-denklem-çözme)
    - [Basit Bir Adi Diferansiyel Denklem Sistemi Çözme](#basit-bir-adi-diferansiyel-denklem-sistemi-çözme)

<!-- /TOC -->

# Julia ile Diferansiyel Denklem Çözmek

## Julia Diferansiyel Denklemler Çözme Paketinin Yüklenmesi

- Wiki Sayfası: [hhttps://diffeq.sciml.ai/release-2.1/](https://diffeq.sciml.ai/release-2.1/)

- Bilimsel Makina öğrenimi açılmış simülasyon ve tahminle diferansiyel denklem çözümü: [https://diffeq.sciml.ai/stable/](https://diffeq.sciml.ai/stable/). Örneğin [DifferentialEquations.jl v6.4.0: Full GPU ODE, Performance, ModelingToolkit](https://sciml.ai/news/2019/05/09/GPU/#differentialequationsjl_v640_full_gpu_ode_performance_modelingtoolkit)

- Bilimsel Makina öğrenimi programı hakkında bilgi: [https://sciml.ai/](https://sciml.ai/)

- Basit bir adi diferansiyel denklemi (ode) Julia program dilini kullanarak çözelim. Julia'yı terminalde açın. Ayrıntılı bilgi için [şu linke](https://diffeq.sciml.ai/stable/solvers/ode_solve/) tıklayınız.

```bash
julia
```

- Aşağıdaki komutu yazarak Julia Differansiyel denklemler paketini indirin.

```julia
julia> import Pkg; Pkg.add("DifferentialEquations")
```

- Diferansiyel denklem paketini derleyin ve çağırın. Bu işlem biraz süre alacaktır.

```julia
julia> @time using DifferentialEquations
[ Info: Precompiling DifferentialEquations [0c46a032-eb83-5123-abaf-570d42b7fbaa]
467.598932 seconds (60.34 M allocations: 3.335 GiB, 0.33% gc time)
```

**Not:** `sudo apt install julia` komutu ile julia yüklendiğinde sorun yaşanabilir.

- Diferansiyel denklem modulunu başarı ile yüklediniz. Diferansiyel denklemlerin çözümlerini çizdirmek gerekmektedir. Bunun için Julia'nın Plots paketini de yükleyin.

```julia
julia> import Pkg; Pkg.add("Plots")
```

- Plots paketini derleyin. Bu işlem biraz süre alacaktır.

```julia
julia> @time using Plots
[ Info: Precompiling Plots [91a5bcdd-55d7-5caf-9e0b-520d859cae80]
137.828417 seconds (12.93 M allocations: 760.269 MiB, 0.25% gc time)
```

- Derleme zamanı bu kadar uzun olması ve bazı diğer açıklamaları [şu linkte](https://stackoverflow.com/questions/47501844/julia-differentialequations-jl-speed) bulabilirsiniz.

## Basit Bir Adi Diferansiyel Denklem Çözme

- $\frac{du}{dt}' = u$ diferansiyel denklemini çözen bir program yazın. Bu denklemi çözecek olan "basitDifDenkCoz.jl" dosyası oluşturun. **NOT:** Eğer yeni bir terminal açmazsanız yukarıdaki derleme işlemlerinin hepsini baştan yapmanız gerekecektir. Bundan kaçınmak için lütfen **yeni terminal** açın.

```bash
touch basitDifDenkCoz.jl
```

- "basitDifDenkCoz.jl" dosyasyının içine aşağıdaki kodu yazın.

```julia
# Differansiyel Denklem Modulunu Cagir
println("Difernasiyel Denklem Cozum Modulunun Yuklenmesi:")
@time using DifferentialEquations
println("===========")
# Cizim modulunu cagirin.
println("Plots Modulunun Yuklenmesi:")
@time using Plots
println("===========")

function difDenkCoz()

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
	@time sol = solve(prob2, RK4(), reltol=1e-8, abstol=1e-8);
	println("===========")

	# --------------------------
	# Cozumu cizdirmek icin

	# Cozdugunuz denklemi cizdirin
	figure1 = plot(sol, linewidth=5, title="Basit Difernasiyel Denklem Cozumu",
		xaxis="Zaman (t)", yaxis="u(t)", label="Sayisal Cozum")

	# Teorik Cozumu de cizdirin
	figure1 = plot!(sol.t, t->0.5*exp(t), lw=3, ls=:dash, label="Teorik Cozum")

	# Grafigi Kaydedin
	png(figure1, "basitDifDenkCoz")
end
```

- Julia arayüzüne geri dönün "basitDifDenkCoz.jl" dosyasını çağırın.

```julia
julia> include("basitDifDenkCoz.jl")
Difernasiyel Denklem Cozum Modulunun Yuklenmesi:
 28.629356 seconds (48.85 M allocations: 2.826 GiB, 4.99% gc time)
===========
Plots Modulunun Yuklenmesi:
 13.123757 seconds (11.98 M allocations: 715.185 MiB, 2.94% gc time)
===========
difdenkcoz (generic function with 1 method)
```

- Yukarıda görüldüğü gibi script'te modüllerin yüklenmesi epeyce uzun bir süre almaktadır. Yukarıdaki komutu çalıştırarak artık "basitDifDenkCoz.jl" içerisindeki fonksiyonlarınızı (değişkenleri) tanımladınız. Şimdi diferansiyel denklem çözen "difdenkcoz()" fonksiyonunu çağıralım.

```julia
julia> difDenkCoz()
Difernasiyel Denklem Cozum Suresi:
  2.395190 seconds (1.83 M allocations: 94.239 MiB)
===========
```

- Eğer ikince kez "basitDifDenkCoz.jl" modülünü çağırırsanırz, bu sürelerin kaydadeğer bir şekilde düştüğünü farkedeceksiniz.

```julia
julia> include("basitDifDenkCoz.jl")
Difernasiyel Denklem Cozum Modulunun Yuklenmesi:
  0.371293 seconds (898.65 k allocations: 43.910 MiB)
===========
Plots Modulunun Yuklenmesi:
  0.000082 seconds (185 allocations: 11.578 KiB)
===========
difdenkcoz (generic function with 1 method)

julia> difdenkcoz()
Difernasiyel Denklem Cozum Suresi:
  1.044728 seconds (1.83 M allocations: 94.239 MiB, 3.05% gc time)
===========
qt5ct: using qt5ct plugin
Qt: Session management error: None of the authentication protocols specified are supported
```

## Basit Bir Adi Diferansiyel Denklem Sistemi Çözme

- Diferansiyel denklem sistemi çözen bir program yazalım. Bu denklem setini çözecek olan fonksiyonu "basitDifDenkCoz.jl" dosyasının içine yazın.

$\frac{d}{dt}u_{1}(t) = 10 (u_{2}(t)-u_{1}(t))$

$\frac{d}{dt}u_{2}(t) = u_{1}(t) (28 - u_{3}(t)) -u_{2}(t)$

$\frac{d}{dt}u_{3}(t) = u_{1}(t) u_{2}(t) - (8/3)u_{3}(t)$

```julia
function difDenkSisCoz()
	
	# Diferansiyel denklem sistemini oluşturun.
	function lorenz(du,u,p,t)
		du[1] = 10.0* (u[2]- u[1])
		du[2] = u[1]* (28.0- u[3])- u[2]
 		du[3] = u[1]* u[2]- (8/3)* u[3]
	end

	# U'nun baslangic degerini belirleyin. (rand fonksiyonu rastgele bir fonksiyon oluşturur.)
	u0 = [1.0;1.0;1.0]

	# t'nin hangi araligina kadar cozeceginizi belirleyin.
	tspan = (0.0, 30.0);

	# Problemi olusturun.
	prob = ODEProblem(lorenz,u0,tspan)

	# Problemi Cozun
	println("Difernasiyel Denklem Cozumeye basladi.")
	sol = solve(prob, RK4(), reltol=1e-8, abstol=1e-8);
	println("Difernasiyel Denklem Cozumeye bitti.")
	# --------------------------
	# Cozumu cizdirmek icin

	# Cozdugunuz denklemi cizdirin
	figure1 = plot(sol, title="Basit Difernasiyel Denklem Cozumu",
		xaxis="Zaman (t)", yaxis="u(t)", label="Sayisal Cozum")

	# Grafigi Kaydedin
	png(figure1, "basitDifDenkSisCoz")

	# Cozdugunuz denklemi cizdirin
	figure1 = plot(sol, title="Basit Difernasiyel Denklem Cozumu",
		label="Sayisal Cozum")

	# Grafigi Kaydedin
	png(figure1, "basitDifDenkSisCoz")

	# Cozdugunuz denklemi cizdirin
	figure2 = plot(sol, vars=(1,2,3), title="Adi Difernasiyel Denklem Sistemi Cozumu")

	# Grafigi Kaydedin
	png(figure2, "basitDifDenkSisCoz3D")
end
```

- Diğer örnekler için [https://diffeq.sciml.ai/stable/tutorials/ode_example/](https://diffeq.sciml.ai/stable/tutorials/ode_example/) sitesine bakabiliriz.



