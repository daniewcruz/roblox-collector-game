--!strict
-- Esquema de dados de Mimo + sistema de raridade cumulativa (D022: pendente desde a Configuração
-- Técnica). Padrão de raridade adaptado de referência de arquitetura de tutorial de terceiros
-- (tabela cumulativa de probabilidade) — sem copiar nomes, assets ou conteúdo, só a lógica.
--
-- Como funciona a raridade cumulativa:
--   RARITY_MAX define a precisão (100 = 2 casas, 1000 = 3 casas, etc).
--   Cada Mimo tem um "rarity" que é a SOMA acumulada das chances anteriores + a própria chance.
--   Exemplo com RARITY_MAX = 100: Comum 60% -> rarity=60; Raro 25% -> rarity=85; Épico 12% ->
--   rarity=97; Lendário 3% -> rarity=100 (sempre = RARITY_MAX no último).
--   Sortear: math.random(1, RARITY_MAX), percorrer a lista até achar o primeiro cujo rarity
--   seja >= ao número sorteado.

export type MimoDefinition = {
	name: string,
	family: string, -- família visual (D026): Cute, Cool, Majestic, Mystic, Chaotic, Legendary
	rarity: number, -- valor cumulativo, não a % isolada (ver comentário acima)
}

export type RegionDefinition = {
	rarityMax: number,
	mimos: { MimoDefinition },
}

local MimoData = {}

-- Placeholders da região do MVP (D011: 1 região, ~10-15 Mimos) — nomes de exemplo, substituir
-- pelos Mimos reais quando o elenco de lançamento for escolhido (ver docs/12-conceitos-mimo.md).
MimoData.Regions = {
	ValeDasPrimeirasLuzes = {
		rarityMax = 100,
		mimos = {
			{ name = "MimoComum", family = "Cute", rarity = 60 },
			{ name = "MimoRaro", family = "Cool", rarity = 85 },
			{ name = "MimoEpico", family = "Mystic", rarity = 97 },
			{ name = "MimoLendario", family = "Majestic", rarity = 100 },
		},
	} :: RegionDefinition,
}

-- Sorteia um Mimo da região dada, usando o padrão de raridade cumulativa.
function MimoData.rollMimo(regionName: string): MimoDefinition?
	local region = MimoData.Regions[regionName]
	if not region then
		return nil
	end

	local roll = math.random(1, region.rarityMax)
	for _, mimo in region.mimos do
		if roll <= mimo.rarity then
			return mimo
		end
	end

	return nil -- não deveria acontecer se as raridades somarem certo até rarityMax
end

return MimoData
