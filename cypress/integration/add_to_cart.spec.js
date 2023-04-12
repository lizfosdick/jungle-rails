describe('Jungle Rails homepage', () => {
  it("should visit root", () => {
    cy.visit("http://localhost:3000/");
  });

  it("adds the product to the cart", () => {
    cy.contains('My Cart (0)')
    cy.contains("Add").first().click()
    cy.contains("My Cart (1)")
  })

})