import { defineSupportCode } from 'cucumber';

defineSupportCode(({setDefaultTimeout}) => {
    setDefaultTimeout(30000);
});
