#noload

MachineryRecipeManager.addRecipe(new MachineryRecipeBuilder()
    .machine("mmr:test_machine")
    .recipeTime(100)
    .size(100,100)
    .requirement([
        MacgineryRecipeTypes.requireChemical("mekanism:gold", 1000),
        MacgineryRecipeTypes.chunkload(3)
    ])
);