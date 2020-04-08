const isEmpty = (string) => {
    if (string.trim() === "") return true
    else return false;
}

const ValidateData = (error) => {
    const errors = {}
    for (e in error) {
        if (isEmpty(error[e])) errors[e] = "Must Not Be Empty";
    }

    return errors;
}

module.exports = {ValidateData};