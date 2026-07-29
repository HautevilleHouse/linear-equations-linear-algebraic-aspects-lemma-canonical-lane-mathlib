import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

/-!
# Gram-Schmidt Orthogonalization Package
-/

structure GramSchmidtPackage {V : Type u} [AddCommGroup V] [Module ℝ V] [InnerProductSpace ℝ V] where
  originalBasis : Set V
  orthogonalBasis : Set V
  orthonormalBasis : Set V
  spansSameSubspace : Submodule.span ℝ originalBasis = Submodule.span ℝ orthogonalBasis
  gramSchmidtProcessApplied : Prop
  orthonormalSet : orthonormalBasis ⊆ orthogonalBasis
  orthonormalInnerProducts : ∀ v ∈ orthonormalBasis, ∀ w ∈ orthonormalBasis, v ≠ w → ⟪v, w⟫ = 0
  orthonormalNormOne : ∀ v ∈ orthonormalBasis, ‖v‖ = 1

structure GramSchmidtEvidence {V : Type u} [AddCommGroup V] [Module ℝ V] [InnerProductSpace ℝ V] (G : GramSchmidtPackage V) where
  spansSameSubspaceClosed : G.spansSameSubspace
  gramSchmidtProcessAppliedClosed : G.gramSchmidtProcessApplied
  orthonormalSetClosed : G.orthonormalSet
  orthonormalInnerProductsClosed : G.orthonormalInnerProducts
  orthonormalNormOneClosed : G.orthonormalNormOne

def GramSchmidtClosed {V : Type u} [AddCommGroup V] [Module ℝ V] [InnerProductSpace ℝ V] (G : GramSchmidtPackage V) : Prop :=
  G.spansSameSubspace ∧ G.gramSchmidtProcessApplied ∧ G.orthonormalSet ∧ G.orthonormalInnerProducts ∧ G.orthonormalNormOne

theorem gram_schmidt_closed_from_evidence {V : Type u} [AddCommGroup V] [Module ℝ V] [InnerProductSpace ℝ V]
    (G : GramSchmidtPackage V) (E : GramSchmidtEvidence G) : GramSchmidtClosed G :=
  And.intro E.spansSameSubspaceClosed (And.intro E.gramSchmidtProcessAppliedClosed (And.intro E.orthonormalSetClosed (And.intro E.orthonormalInnerProductsClosed E.orthonormalNormOneClosed)))

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse