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
