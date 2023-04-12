describe('Navigate to product details page', () => {
  it("should visit root", () => {
    cy.visit("http://localhost:3000/");
  });

  it("should take user to product details page", () => {
    cy.contains('Scented').click();
  })

})