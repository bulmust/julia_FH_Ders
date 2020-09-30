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