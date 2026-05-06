<template>
    <div class="ethics-layout">
        <!-- LEFT SIDE -->
        <aside class="left">
            <div class="section-header">
                Identification, Identity, and the Digital Age
            </div>

            <ParagraphBlock
                text="As government identity becomes increasingly regulated, the individuals are able to verify, update, and present their legal identity across systems directly affects access to mobility, safety, and recognition of ones personhood"
            />
            <Passport />
            <GovActionCard
                citation-text="The Williams Institute"
                citation-url="https://williamsinstitute.law.ucla.edu/press/trans-moving-press-release"
            />

            <ParagraphBlock
                label="The Right(?) to Vote"
                text="At the same time identification is being legistlated for transgender people, there's a wider push to require ID to vote. This raises yet another barrier to trans peoples participation in the public life"
            />
        </aside>

        <!-- RIGHT SIDE -->
        <section class="right">
            <div class="section-header">State & Institutional Pressure</div>
            <GovActionCard
                title='"Radical Ideology" FBI memo'
                date="December 2025"
                description='In December of 2025 Attorney General Pam Bondi directed the FBI to establish a cash based reward system for information leading to the arrest of members of organizations associated with "radical gender ideology", which the DOJ has since labeled as "domestic terrorist groups"'
            />

            <ParagraphBlock
                text="Technology plays a central role in the categorization and targeting of marginalized peoples. In campaigns like the Attorney Generals, digital databases and automated tracking tools amplify enforcement efforts and shape how policy is applied to communities."
            />

            <GovActionCard
                title="Grant removal"
                date="2025"
                description='The federal government announces cuts to "woke programs" including funding for the NSF'
                citation-text="The White House"
                citation-url="https://www.whitehouse.gov/wp-content/uploads/2025/05/Cuts-to-Woke-Programs-Fact-Sheet.pdf"
            />

            <AnimatedStat
                :value="121"
                label="Anti-Trans Bills in the Federal Legislature"
                citation-text="Trans Legislation Tracker (2026)"
                citation-url="https://translegislation.com/bills/2026/US"
            />

            <AnimatedStat
                :value="528"
                label="Anti LGBTQ Bills in State Legislatures"
                citation-text="American Civil Liberties Union (ACLU 2026)"
                citation-url="https://www.aclu.org/legislative-attacks-on-lgbtq-rights-2026"
            />

            <GovActionCard
                title="Tennessee HB 0754"
                date="April 2026"
                description="Tennesse advances a bill which would require gender-affirming care providers to report patient data to the DoH, which would then be made public. Insurance providers who cover GAC would also have to cover detransition care, and counties would no longer be able to legislate conversion therapy. While aggregate recording has been a practice for some time, publishing of private data is extremely uncommon"
                citation-text="Southern Equality"
                citation-url="https://southernequality.org/hb0754/"
            />
            <ParagraphBlock
                label="Gender Identity and Detention"
                text="Transgender and nonbinary individuals face unique challenges within immigration enforcement and detention systems. Many experience heightened risks of harassment and physical or sexual assault while in detention. Access to gender-affirming healthcare, including hormone therapy and mental health support, is often limited or entirely denied, which can exacerbate dysphoria and psychological distress. Advocates emphasize the need for policies that respect gender identity, provide necessary medical care, and ensure safety and dignity for all detainees."
            />
        </section>
    </div>
</template>

<script setup>
import Passport from "./Passport.vue";
import AnimatedStat from "./AnimatedStat.vue";
import GovActionCard from "./GovActionCard.vue";
import ParagraphBlock from "./ParagraphBlock.vue";
</script>

<style scoped>
.ethics-layout {
    display: flex;
    gap: 32px;
    align-items: flex-start;
    padding: 10px;
}

/* TRUE 50/50 SPLIT */
.left,
.right {
    flex: 1;
    width: 50%;
}

.left {
    display: flex;
    flex-direction: column; /* 🔥 this is the key fix */
    justify-content: flex-start;
    align-items: center; /* optional: keeps Passport centered */
    position: sticky;
    top: 20px;
    align-self: flex-start;
}

/* RIGHT SIDE (content stack) */
.right {
    display: flex;
    flex-direction: column;
    gap: 16px;
}

/* Optional subtle visual separation */
.right {
    border-left: 1px solid rgba(0, 0, 0, 0.08);
    padding-left: 24px;
}

/* Responsive stacking */
@media (max-width: 900px) {
    .ethics-layout {
        flex-direction: column;
    }

    .left,
    .right {
        width: 100%;
    }

    .right {
        border-left: none;
        padding-left: 0;
    }
    .left {
        position: relative;
    }
}

.right-header {
    font-size: 22px;
    font-weight: 600;
    margin-bottom: 12px;
    letter-spacing: 0.5px;
    text-transform: uppercase;
    color: #222;
}
.section-header {
    font-size: 14px;
    font-weight: 700;
    letter-spacing: 2px;
    text-transform: uppercase;
    color: rgba(8, 26, 51, 0.7);
    margin-bottom: 12px;
}
</style>
