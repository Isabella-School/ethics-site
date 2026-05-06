<template>
    <div class="paragraph-block">
        <div v-if="label" class="label">
            {{ label }}
        </div>

        <p class="text">
            {{ text }}
        </p>

        <div v-if="citationText" class="citation">
            Source:
            <a
                v-if="citationUrl"
                :href="citationUrl"
                target="_blank"
                rel="noopener noreferrer"
            >
                {{ citationText }}
            </a>
            <span v-else>{{ citationText }}</span>
        </div>
    </div>
</template>

<script setup>
defineProps({
    text: { type: String, required: true },

    label: { type: String, default: "" },

    citationText: { type: String, default: "" },
    citationUrl: { type: String, default: "" },
});
</script>

<style scoped>
.paragraph-block {
    background: #ffffff;
    border: 1px solid rgba(8, 26, 51, 0.08);
    border-left: 4px solid #081a33;
    padding: 14px 16px;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.04);
    margin: 20px auto; /* centers horizontally and adds vertical spacing */
    max-width: 600px; /* optional: prevents card from being too wide */
}

/* optional small section label */
.label {
    font-size: 11px;
    font-weight: 600;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: rgba(8, 26, 51, 0.6);
    margin-bottom: 6px;
}

.text {
    font-size: 13px;
    line-height: 1.6;
    color: #333;
    margin: 0;
}

.citation {
    margin-top: 10px;
    font-size: 11px;
    opacity: 0.7;
}

.citation a {
    color: #081a33;
    text-decoration: underline;
}
</style>
