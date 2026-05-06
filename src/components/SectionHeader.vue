<template>
    <header class="section-header">
        <div class="line" />

        <div class="content">
            <h2 class="title">{{ title }}</h2>
            <p v-if="subtitle" class="subtitle">{{ subtitle }}</p>
        </div>

        <div class="line" />
    </header>
</template>

<script setup>
defineProps({
    title: {
        type: String,
        required: true,
    },
    subtitle: {
        type: String,
        default: "",
    },
});
</script>

<style scoped>
.section-header {
    display: flex;
    align-items: center;
    gap: 16px;
    margin: 10px 0 30px;
}

/* decorative lines */
.line {
    flex: 1;
    height: 1px;
    background: rgba(0, 0, 0, 0.12);
}

/* text block */
.content {
    text-align: center;
    max-width: 600px;
}

.title {
    margin: 0;
    font-size: 1.4rem;
    letter-spacing: 0.5px;
}

.subtitle {
    margin: 6px 0 0;
    font-size: 0.9rem;
    color: rgba(0, 0, 0, 0.6);
}
</style>
