function r = subsref(val, idx)
    methodList = {...
        'assertElementsAlmostEqual',...
        'assertEqual',...
        'assertExceptionThrown',...
        'assertFalse',...
        'assertTrue',...
        'assertVectorsAlmostEqual'};

    r = [];
    type = idx.type;
    subs = idx.subs;

    for i=methodList
        if (strcmp(type, ".") && strcmp(subs, i{:}))
            r = eval(['@', subs]);
        end
    end

    if isempty(r)
        error(['Undefined method: ', subs]);
    end
