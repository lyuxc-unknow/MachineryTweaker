#debug

MachineryRecipeManager.addRecipe(new MachineryRecipeBuilder()
    .machine("mmr:test_machine")
    .recipeTime(100)
    .size(100,100)
    .requirement([
        MacgineryRecipeTypes.experience(1000,"input"),
        MacgineryRecipeTypes.chunkload(3)
    ])
);