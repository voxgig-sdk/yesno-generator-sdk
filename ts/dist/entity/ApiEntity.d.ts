import { YesnoGeneratorEntityBase } from '../YesnoGeneratorEntityBase';
import type { YesnoGeneratorSDK } from '../YesnoGeneratorSDK';
import type { Control } from '../types';
import type { Api, ApiLoadMatch } from '../YesnoGeneratorTypes';
declare class ApiEntity extends YesnoGeneratorEntityBase<Api> {
    constructor(client: YesnoGeneratorSDK, entopts: any);
    make(this: ApiEntity): ApiEntity;
    load(this: any, reqmatch?: ApiLoadMatch, ctrl?: Control): Promise<ApiEntity>;
}
export { ApiEntity };
