<template>
    <div class="action-card">
        <div class="header">
            <div class="title">{{ title }}</div>
            <div class="date">{{ date }}</div>
        </div>

        <div class="body">
            <p class="description">
                {{ description }}
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

        <div v-if="tag" class="tag">
            {{ tag }}
        </div>
    </div>
</template>

<script setup>
defineProps({
    title: { type: String, required: true },
    date: { type: String, required: true },
    description: { type: String, required: true },

    tag: { type: String, default: "" },

    citationText: { type: String, default: "" },
    citationUrl: { type: String, default: "" },
});
</script>

<style scoped>
.action-card {
    background: #ffffff;
    border: 1px solid rgba(8, 26, 51, 0.1);
    border-left: 4px solid #081a33;
    padding: 16px;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
    margin-bottom: 12px;
}

.header {
    display: flex;
    justify-content: space-between;
    margin-bottom: 8px;
}

.title {
    font-weight: 600;
    color: #081a33;
}

.date {
    font-size: 12px;
    opacity: 0.6;
}

.description {
    font-size: 13px;
    line-height: 1.4;
    color: #333;
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

.tag {
    margin-top: 10px;
    font-size: 10px;
    display: inline-block;
    padding: 3px 8px;
    border-radius: 999px;
    background: rgba(8, 26, 51, 0.08);
    color: #081a33;
}
</style>
