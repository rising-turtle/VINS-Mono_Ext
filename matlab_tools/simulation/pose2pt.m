%% extract location from pose
function pt = pose2pt(pose)
    import gtsam.*
    C = pose.translation().vector();
    pt = [C(1), C(2), C(3)];
end