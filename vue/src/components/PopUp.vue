<template>
    <div class="popup">
        <div class="popup-inner">
            <slot></slot>
            <button class="popup-close" @click="closePopup">
                Close Popup
            </button>
        </div>
    </div>
</template>

<script>
export default{
 method:{
    closePopup(){
        this.$emit('new-example');
    }
 }
}
</script>

<style Lang= "scss" scoped>
.popup{
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 99;
    background-color: rgba(0,0,0,0.2);

    display: flex;
    align-items: center;
    justify-content: center;
}
.popup-inner{
    padding: 32px;
    background: #fff;
}
</style>