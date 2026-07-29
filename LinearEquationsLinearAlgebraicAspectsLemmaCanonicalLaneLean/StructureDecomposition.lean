import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure StructureDecompositionPackage where
  vectorSpace : Type u
  subspaces : List (Subspace (vectorSpace : Type u))
  directSumDecomposition : Prop
  basisInduced : Prop
  dimensionAdditivity : Prop

structure StructureDecompositionEvidence (D : StructureDecompositionPackage) where
  directSumDecompositionClosed : D.directSumDecomposition
  basisInducedClosed : D.basisInduced
  dimensionAdditivityClosed : D.dimensionAdditivity

def StructureDecompositionClosed (D : StructureDecompositionPackage) : Prop :=
  D.directSumDecomposition ∧ D.basisInduced ∧ D.dimensionAdditivity

theorem structure_decomposition_closed_from_evidence
    (D : StructureDecompositionPackage) (E : StructureDecompositionEvidence D) :
    StructureDecompositionClosed D := by
  exact And.intro E.directSumDecompositionClosed
    (And.intro E.basisInducedClosed E.dimensionAdditivityClosed)

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse