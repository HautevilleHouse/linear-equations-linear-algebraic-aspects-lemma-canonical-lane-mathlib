import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure VectorSpacePackage (F : Type u) [Field F] where
  carrier : Type v
  zero : carrier
  add : carrier → carrier → carrier
  smul : F → carrier → carrier
  addAssoc : ∀ x y z : carrier, add (add x y) z = add x (add y z)
  addComm : ∀ x y : carrier, add x y = add y x
  zeroAdd : ∀ x : carrier, add zero x = x
  addZero : ∀ x : carrier, add x zero = x
  addLeftNeg : ∀ x : carrier, ∃ y : carrier, add x y = zero
  smulOne : ∀ x : carrier, smul 1 x = x
  smulAssoc : ∀ (a b : F) (x : carrier), smul (a * b) x = smul a (smul b x)
  smulAddDistrib : ∀ (a : F) (x y : carrier), smul a (add x y) = add (smul a x) (smul a y)
  addSmulDistrib : ∀ (a b : F) (x : carrier), smul (a + b) x = add (smul a x) (smul b x)

structure VectorSpaceEvidence (V : VectorSpacePackage F) where
  zeroAddClosed : V.zeroAdd
  addZeroClosed : V.addZero
  addLeftNegClosed : V.addLeftNeg
  smulOneClosed : V.smulOne
  smulAssocClosed : V.smulAssoc
  smulAddDistribClosed : V.smulAddDistrib
  addSmulDistribClosed : V.addSmulDistrib

def VectorSpaceClosed (V : VectorSpacePackage F) : Prop :=
  V.zeroAdd ∧ V.addZero ∧ V.addLeftNeg ∧ V.smulOne ∧ V.smulAssoc ∧ V.smulAddDistrib ∧ V.addSmulDistrib

theorem vector_space_closed_from_evidence (V : VectorSpacePackage F) (E : VectorSpaceEvidence V) : VectorSpaceClosed V := by
  exact And.intro E.zeroAddClosed (And.intro E.addZeroClosed (And.intro E.addLeftNegClosed (And.intro E.smulOneClosed (And.intro E.smulAssocClosed (And.intro E.smulAddDistribClosed E.addSmulDistribClosed)))))

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse
