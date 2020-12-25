<template>
    <v-dialog
        v-model="dialog"
        scrollable 
        :overlay="false"
        max-width="500px"
        transition="dialog-transition"
    >
    <template v-slot:activator="{ on }">
        <slot name="activator" :on="on"></slot>
    </template>

    <v-card>
        <v-card-title class="headline">
            <slot name="title"></slot>
        </v-card-title>

        <v-card-text class="pt-0">
            <slot></slot>
        </v-card-text>

        <v-card-actions>
            <slot name="action">
                <v-spacer></v-spacer>
                <v-btn text @click="dialog = false">close</v-btn>
            </slot>
        </v-card-actions>
    </v-card>

    </v-dialog>
</template>

<script>
export default {
    props: ['value'],
    data: () => ({

    }),
    computed: {
        dialog: {
            get() {
                return this.value;
            },
            set(val) {
                this.$emit('input', val);
            },
        }
    },
};
</script>

<style>

</style>