function options = default_option()
    % Data Options
    options.triangle = false;
    options.nrCameras = 20;
    options.showImages = false;

    % iSAM Options
    options.hardConstraint = false;
    options.pointPriors = true;
    options.batchInitialization = true;
    options.reorderInterval = 10;
    options.alwaysRelinearize = false;

    % Display Options
    options.saveDotFile = false;
    options.printStats = false;
    options.drawInterval = 5;
    options.cameraInterval = 1;
    options.drawTruePoses = false;
    options.saveFigures = false;
    options.saveDotFiles = false;
end
